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
entity add2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_201aeef3;
architecture arch of add2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l554_c6_f5f3]
signal BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c1_ae46]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l554_c2_52b6]
signal tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l554_c2_52b6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c2_52b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l554_c2_52b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l554_c2_52b6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l554_c2_52b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c2_52b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l554_c2_52b6]
signal result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l554_c2_52b6]
signal t16_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l554_c2_52b6]
signal n16_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l555_c3_6367[uxn_opcodes_h_l555_c3_6367]
signal printf_uxn_opcodes_h_l555_c3_6367_uxn_opcodes_h_l555_c3_6367_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l560_c11_1c67]
signal BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l560_c7_832f]
signal tmp16_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l560_c7_832f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l560_c7_832f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l560_c7_832f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l560_c7_832f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l560_c7_832f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l560_c7_832f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l560_c7_832f]
signal result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l560_c7_832f]
signal t16_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l560_c7_832f]
signal n16_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l563_c11_35fc]
signal BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l563_c7_666a]
signal tmp16_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l563_c7_666a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l563_c7_666a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l563_c7_666a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l563_c7_666a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l563_c7_666a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l563_c7_666a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l563_c7_666a]
signal result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l563_c7_666a]
signal t16_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l563_c7_666a]
signal n16_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l568_c11_81ab]
signal BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l568_c7_506c]
signal tmp16_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l568_c7_506c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l568_c7_506c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l568_c7_506c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l568_c7_506c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l568_c7_506c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l568_c7_506c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l568_c7_506c]
signal result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l568_c7_506c]
signal t16_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l568_c7_506c]
signal n16_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l571_c11_9abd]
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l571_c7_91bc]
signal tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l571_c7_91bc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_91bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_91bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l571_c7_91bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l571_c7_91bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_91bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l571_c7_91bc]
signal result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l571_c7_91bc]
signal t16_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l571_c7_91bc]
signal n16_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l572_c3_b3b5]
signal BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l575_c11_7fe8]
signal BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l575_c7_e0b0]
signal tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l575_c7_e0b0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l575_c7_e0b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l575_c7_e0b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l575_c7_e0b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l575_c7_e0b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l575_c7_e0b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l575_c7_e0b0]
signal result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l575_c7_e0b0]
signal n16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l578_c11_fc33]
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l578_c7_1ad6]
signal tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l578_c7_1ad6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_1ad6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_1ad6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l578_c7_1ad6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_1ad6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_1ad6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l578_c7_1ad6]
signal result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l578_c7_1ad6]
signal n16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l583_c11_47e3]
signal BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l583_c7_599b]
signal tmp16_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l583_c7_599b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l583_c7_599b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l583_c7_599b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l583_c7_599b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l583_c7_599b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l583_c7_599b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l583_c7_599b]
signal result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l583_c7_599b]
signal n16_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l586_c11_ac8f]
signal BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l586_c7_9f79]
signal tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l586_c7_9f79]
signal result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l586_c7_9f79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l586_c7_9f79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l586_c7_9f79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l586_c7_9f79]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l586_c7_9f79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l586_c7_9f79]
signal result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l586_c7_9f79]
signal n16_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l587_c3_51cf]
signal BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l588_c11_bf61]
signal BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l591_c32_859c]
signal BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l591_c32_d092]
signal BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l591_c32_ce7e]
signal MUX_uxn_opcodes_h_l591_c32_ce7e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l591_c32_ce7e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l591_c32_ce7e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l591_c32_ce7e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l593_c11_cd89]
signal BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l593_c7_73f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l593_c7_73f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l593_c7_73f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l593_c7_73f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l593_c7_73f3]
signal result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l599_c11_3aaf]
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l599_c7_1f09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l599_c7_1f09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_1f09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l599_c7_1f09]
signal result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l601_c34_6e0b]
signal CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l603_c11_ce4f]
signal BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l603_c7_0ea6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l603_c7_0ea6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3
BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_left,
BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_right,
BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_return_output);

-- tmp16_MUX_uxn_opcodes_h_l554_c2_52b6
tmp16_MUX_uxn_opcodes_h_l554_c2_52b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_cond,
tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue,
tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse,
tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6
result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6
result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6
result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6
result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6
result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_cond,
result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_return_output);

-- t16_MUX_uxn_opcodes_h_l554_c2_52b6
t16_MUX_uxn_opcodes_h_l554_c2_52b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l554_c2_52b6_cond,
t16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue,
t16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse,
t16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output);

-- n16_MUX_uxn_opcodes_h_l554_c2_52b6
n16_MUX_uxn_opcodes_h_l554_c2_52b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l554_c2_52b6_cond,
n16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue,
n16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse,
n16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output);

-- printf_uxn_opcodes_h_l555_c3_6367_uxn_opcodes_h_l555_c3_6367
printf_uxn_opcodes_h_l555_c3_6367_uxn_opcodes_h_l555_c3_6367 : entity work.printf_uxn_opcodes_h_l555_c3_6367_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l555_c3_6367_uxn_opcodes_h_l555_c3_6367_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67
BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_left,
BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_right,
BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output);

-- tmp16_MUX_uxn_opcodes_h_l560_c7_832f
tmp16_MUX_uxn_opcodes_h_l560_c7_832f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l560_c7_832f_cond,
tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue,
tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse,
tmp16_MUX_uxn_opcodes_h_l560_c7_832f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f
result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f
result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f
result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f
result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f
result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f
result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_cond,
result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_return_output);

-- t16_MUX_uxn_opcodes_h_l560_c7_832f
t16_MUX_uxn_opcodes_h_l560_c7_832f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l560_c7_832f_cond,
t16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue,
t16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse,
t16_MUX_uxn_opcodes_h_l560_c7_832f_return_output);

-- n16_MUX_uxn_opcodes_h_l560_c7_832f
n16_MUX_uxn_opcodes_h_l560_c7_832f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l560_c7_832f_cond,
n16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue,
n16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse,
n16_MUX_uxn_opcodes_h_l560_c7_832f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc
BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_left,
BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_right,
BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l563_c7_666a
tmp16_MUX_uxn_opcodes_h_l563_c7_666a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l563_c7_666a_cond,
tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue,
tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse,
tmp16_MUX_uxn_opcodes_h_l563_c7_666a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a
result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a
result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a
result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a
result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a
result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a
result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_cond,
result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_return_output);

-- t16_MUX_uxn_opcodes_h_l563_c7_666a
t16_MUX_uxn_opcodes_h_l563_c7_666a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l563_c7_666a_cond,
t16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue,
t16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse,
t16_MUX_uxn_opcodes_h_l563_c7_666a_return_output);

-- n16_MUX_uxn_opcodes_h_l563_c7_666a
n16_MUX_uxn_opcodes_h_l563_c7_666a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l563_c7_666a_cond,
n16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue,
n16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse,
n16_MUX_uxn_opcodes_h_l563_c7_666a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab
BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_left,
BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_right,
BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l568_c7_506c
tmp16_MUX_uxn_opcodes_h_l568_c7_506c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l568_c7_506c_cond,
tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue,
tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse,
tmp16_MUX_uxn_opcodes_h_l568_c7_506c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c
result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c
result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c
result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c
result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c
result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c
result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_cond,
result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_return_output);

-- t16_MUX_uxn_opcodes_h_l568_c7_506c
t16_MUX_uxn_opcodes_h_l568_c7_506c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l568_c7_506c_cond,
t16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue,
t16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse,
t16_MUX_uxn_opcodes_h_l568_c7_506c_return_output);

-- n16_MUX_uxn_opcodes_h_l568_c7_506c
n16_MUX_uxn_opcodes_h_l568_c7_506c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l568_c7_506c_cond,
n16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue,
n16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse,
n16_MUX_uxn_opcodes_h_l568_c7_506c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd
BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_left,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_right,
BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l571_c7_91bc
tmp16_MUX_uxn_opcodes_h_l571_c7_91bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_cond,
tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue,
tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse,
tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc
result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc
result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc
result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_cond,
result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_return_output);

-- t16_MUX_uxn_opcodes_h_l571_c7_91bc
t16_MUX_uxn_opcodes_h_l571_c7_91bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l571_c7_91bc_cond,
t16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue,
t16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse,
t16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output);

-- n16_MUX_uxn_opcodes_h_l571_c7_91bc
n16_MUX_uxn_opcodes_h_l571_c7_91bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l571_c7_91bc_cond,
n16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue,
n16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse,
n16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5
BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_left,
BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_right,
BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8
BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_left,
BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_right,
BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0
tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond,
tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0
result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0
result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0
result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0
result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0
result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output);

-- n16_MUX_uxn_opcodes_h_l575_c7_e0b0
n16_MUX_uxn_opcodes_h_l575_c7_e0b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond,
n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue,
n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse,
n16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33
BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_left,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_right,
BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output);

-- tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6
tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond,
tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue,
tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse,
tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6
result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6
result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6
result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_cond,
result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output);

-- n16_MUX_uxn_opcodes_h_l578_c7_1ad6
n16_MUX_uxn_opcodes_h_l578_c7_1ad6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond,
n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue,
n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse,
n16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3
BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_left,
BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_right,
BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l583_c7_599b
tmp16_MUX_uxn_opcodes_h_l583_c7_599b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l583_c7_599b_cond,
tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue,
tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse,
tmp16_MUX_uxn_opcodes_h_l583_c7_599b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b
result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b
result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b
result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b
result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_cond,
result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_return_output);

-- n16_MUX_uxn_opcodes_h_l583_c7_599b
n16_MUX_uxn_opcodes_h_l583_c7_599b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l583_c7_599b_cond,
n16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue,
n16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse,
n16_MUX_uxn_opcodes_h_l583_c7_599b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f
BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_left,
BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_right,
BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l586_c7_9f79
tmp16_MUX_uxn_opcodes_h_l586_c7_9f79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_cond,
tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue,
tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse,
tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79
result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79
result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79
result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79
result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79
result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_cond,
result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_return_output);

-- n16_MUX_uxn_opcodes_h_l586_c7_9f79
n16_MUX_uxn_opcodes_h_l586_c7_9f79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l586_c7_9f79_cond,
n16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue,
n16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse,
n16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf
BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_left,
BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_right,
BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61
BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_left,
BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_right,
BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l591_c32_859c
BIN_OP_AND_uxn_opcodes_h_l591_c32_859c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_left,
BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_right,
BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l591_c32_d092
BIN_OP_GT_uxn_opcodes_h_l591_c32_d092 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_left,
BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_right,
BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_return_output);

-- MUX_uxn_opcodes_h_l591_c32_ce7e
MUX_uxn_opcodes_h_l591_c32_ce7e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l591_c32_ce7e_cond,
MUX_uxn_opcodes_h_l591_c32_ce7e_iftrue,
MUX_uxn_opcodes_h_l591_c32_ce7e_iffalse,
MUX_uxn_opcodes_h_l591_c32_ce7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89
BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_left,
BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_right,
BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3
result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3
result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf
BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_left,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_right,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09
result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09
result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_cond,
result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_return_output);

-- CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b
CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_x,
CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f
BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_left,
BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_right,
BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6
result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6
result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a
CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_return_output,
 tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
 t16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
 n16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output,
 tmp16_MUX_uxn_opcodes_h_l560_c7_832f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_return_output,
 t16_MUX_uxn_opcodes_h_l560_c7_832f_return_output,
 n16_MUX_uxn_opcodes_h_l560_c7_832f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output,
 tmp16_MUX_uxn_opcodes_h_l563_c7_666a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_return_output,
 t16_MUX_uxn_opcodes_h_l563_c7_666a_return_output,
 n16_MUX_uxn_opcodes_h_l563_c7_666a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l568_c7_506c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_return_output,
 t16_MUX_uxn_opcodes_h_l568_c7_506c_return_output,
 n16_MUX_uxn_opcodes_h_l568_c7_506c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output,
 tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_return_output,
 t16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output,
 n16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output,
 tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output,
 n16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output,
 tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output,
 n16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output,
 tmp16_MUX_uxn_opcodes_h_l583_c7_599b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_return_output,
 n16_MUX_uxn_opcodes_h_l583_c7_599b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output,
 tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_return_output,
 n16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output,
 BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_return_output,
 BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_return_output,
 MUX_uxn_opcodes_h_l591_c32_ce7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_return_output,
 CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l557_c3_42b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l555_c3_6367_uxn_opcodes_h_l555_c3_6367_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l561_c3_5d9a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_67ae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l569_c3_4c1f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l573_c3_8cf3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_d296 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l581_c3_5f17 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l584_c3_ae5c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l588_c3_91dc : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_0faa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l597_c24_ff19_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_e0c8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l601_c24_c6cd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l583_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_1360_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l579_l564_l572_l587_DUPLICATE_ff48_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l599_l586_DUPLICATE_3f17_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l550_l608_DUPLICATE_f88d_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_67ae := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l566_c3_67ae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l569_c3_4c1f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l569_c3_4c1f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l581_c3_5f17 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l581_c3_5f17;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_e0c8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_e0c8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l561_c3_5d9a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l561_c3_5d9a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_d296 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l576_c3_d296;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l573_c3_8cf3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l573_c3_8cf3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_0faa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_0faa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l557_c3_42b3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l557_c3_42b3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l584_c3_ae5c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l584_c3_ae5c;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l575_c11_7fe8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_left;
     BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output := BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l583_c11_47e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l571_c11_9abd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_left;
     BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output := BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l578_c11_fc33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_left;
     BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output := BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l591_c32_859c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_left;
     BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_return_output := BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l586_c11_ac8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_left;
     BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output := BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l601_c34_6e0b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_return_output := CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l597_c24_ff19] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l597_c24_ff19_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l560_c11_1c67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_left;
     BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output := BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l563_c11_35fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l554_c6_f5f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l583_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_1360 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l583_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_1360_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l599_c11_3aaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l599_l586_DUPLICATE_3f17 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l599_l586_DUPLICATE_3f17_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l603_c11_ce4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l593_c11_cd89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_left;
     BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_return_output := BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l579_l564_l572_l587_DUPLICATE_ff48 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l579_l564_l572_l587_DUPLICATE_ff48_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l568_c11_81ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_left := VAR_BIN_OP_AND_uxn_opcodes_h_l591_c32_859c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l554_c6_f5f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_1c67_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l563_c11_35fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l568_c11_81ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l571_c11_9abd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l575_c11_7fe8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l578_c11_fc33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l583_c11_47e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c11_ac8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_cd89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_3aaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_ce4f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l579_l564_l572_l587_DUPLICATE_ff48_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l579_l564_l572_l587_DUPLICATE_ff48_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l579_l564_l572_l587_DUPLICATE_ff48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l597_c24_ff19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_05ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l583_l578_l575_l603_l571_l599_l568_l593_l563_l586_l560_DUPLICATE_d356_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l568_l593_l563_l560_DUPLICATE_fa2c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l583_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_1360_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l583_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_1360_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l583_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_1360_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l583_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_1360_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l583_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_1360_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l583_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_1360_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l583_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_1360_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l583_l578_l575_l571_l568_l563_l586_l560_DUPLICATE_1360_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l583_l554_l578_l575_l603_l571_l599_l568_l563_l586_l560_DUPLICATE_4ba9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l599_l586_DUPLICATE_3f17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l599_l586_DUPLICATE_3f17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l583_l554_l578_l575_l571_l599_l568_l563_l586_l560_DUPLICATE_9182_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l586_c7_9f79] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l593_c7_73f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l603_c7_0ea6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l554_c1_ae46] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l601_c24_c6cd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l601_c24_c6cd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l601_c34_6e0b_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l599_c7_1f09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l572_c3_b3b5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_left;
     BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_return_output := BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l587_c3_51cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_left;
     BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_return_output := BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l591_c32_d092] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_left;
     BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_return_output := BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l603_c7_0ea6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l591_c32_d092_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l572_c3_b3b5_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_right := VAR_BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l587_c3_51cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l601_c24_c6cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l565_l580_DUPLICATE_f02a_return_output;
     VAR_printf_uxn_opcodes_h_l555_c3_6367_uxn_opcodes_h_l555_c3_6367_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l554_c1_ae46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c7_73f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l603_c7_0ea6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_1f09_return_output;
     -- MUX[uxn_opcodes_h_l591_c32_ce7e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l591_c32_ce7e_cond <= VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_cond;
     MUX_uxn_opcodes_h_l591_c32_ce7e_iftrue <= VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_iftrue;
     MUX_uxn_opcodes_h_l591_c32_ce7e_iffalse <= VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_return_output := MUX_uxn_opcodes_h_l591_c32_ce7e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l593_c7_73f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_1f09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l599_c7_1f09] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_cond;
     result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_return_output := result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l599_c7_1f09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_return_output;

     -- printf_uxn_opcodes_h_l555_c3_6367[uxn_opcodes_h_l555_c3_6367] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l555_c3_6367_uxn_opcodes_h_l555_c3_6367_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l555_c3_6367_uxn_opcodes_h_l555_c3_6367_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l586_c7_9f79] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l588_c11_bf61] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_left;
     BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_return_output := BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_return_output;

     -- t16_MUX[uxn_opcodes_h_l571_c7_91bc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l571_c7_91bc_cond <= VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_cond;
     t16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue;
     t16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output := t16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l583_c7_599b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_return_output;

     -- n16_MUX[uxn_opcodes_h_l586_c7_9f79] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l586_c7_9f79_cond <= VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_cond;
     n16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue;
     n16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output := n16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l588_c3_91dc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l588_c11_bf61_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue := VAR_MUX_uxn_opcodes_h_l591_c32_ce7e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_1f09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l583_c7_599b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l599_c7_1f09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_73f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l599_c7_1f09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue := VAR_tmp16_uxn_opcodes_h_l588_c3_91dc;
     -- t16_MUX[uxn_opcodes_h_l568_c7_506c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l568_c7_506c_cond <= VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_cond;
     t16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue;
     t16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_return_output := t16_MUX_uxn_opcodes_h_l568_c7_506c_return_output;

     -- n16_MUX[uxn_opcodes_h_l583_c7_599b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l583_c7_599b_cond <= VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_cond;
     n16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue;
     n16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_return_output := n16_MUX_uxn_opcodes_h_l583_c7_599b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l586_c7_9f79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l586_c7_9f79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l586_c7_9f79] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_cond;
     tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue;
     tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output := tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l593_c7_73f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l593_c7_73f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l593_c7_73f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l583_c7_599b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l578_c7_1ad6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l583_c7_599b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_73f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l593_c7_73f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l593_c7_73f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l568_c7_506c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l586_c7_9f79] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_cond;
     result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_return_output := result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l586_c7_9f79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;

     -- n16_MUX[uxn_opcodes_h_l578_c7_1ad6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond <= VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond;
     n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue;
     n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output := n16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l575_c7_e0b0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l586_c7_9f79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l578_c7_1ad6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l583_c7_599b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l583_c7_599b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l583_c7_599b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l583_c7_599b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_cond;
     tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_return_output := tmp16_MUX_uxn_opcodes_h_l583_c7_599b_return_output;

     -- t16_MUX[uxn_opcodes_h_l563_c7_666a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l563_c7_666a_cond <= VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_cond;
     t16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue;
     t16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_return_output := t16_MUX_uxn_opcodes_h_l563_c7_666a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l583_c7_599b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l583_c7_599b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l586_c7_9f79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l563_c7_666a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l583_c7_599b_return_output;
     -- t16_MUX[uxn_opcodes_h_l560_c7_832f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l560_c7_832f_cond <= VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_cond;
     t16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue;
     t16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_return_output := t16_MUX_uxn_opcodes_h_l560_c7_832f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l578_c7_1ad6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l578_c7_1ad6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l583_c7_599b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l578_c7_1ad6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_cond;
     tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output := tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l583_c7_599b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_return_output;

     -- n16_MUX[uxn_opcodes_h_l575_c7_e0b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond;
     n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue;
     n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output := n16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l575_c7_e0b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l583_c7_599b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_return_output := result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l571_c7_91bc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l583_c7_599b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l583_c7_599b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l583_c7_599b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l560_c7_832f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l568_c7_506c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l571_c7_91bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l575_c7_e0b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l575_c7_e0b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l571_c7_91bc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l571_c7_91bc_cond <= VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_cond;
     n16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue;
     n16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output := n16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l578_c7_1ad6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;

     -- t16_MUX[uxn_opcodes_h_l554_c2_52b6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l554_c2_52b6_cond <= VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_cond;
     t16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue;
     t16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output := t16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l575_c7_e0b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_cond;
     tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output := tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l578_c7_1ad6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l578_c7_1ad6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output := result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l568_c7_506c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l578_c7_1ad6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l575_c7_e0b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l575_c7_e0b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l571_c7_91bc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_cond;
     tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output := tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l571_c7_91bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l575_c7_e0b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l563_c7_666a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l568_c7_506c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output;

     -- n16_MUX[uxn_opcodes_h_l568_c7_506c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l568_c7_506c_cond <= VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_cond;
     n16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue;
     n16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_return_output := n16_MUX_uxn_opcodes_h_l568_c7_506c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l571_c7_91bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l568_c7_506c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l563_c7_666a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l575_c7_e0b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l571_c7_91bc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_return_output := result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l568_c7_506c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l563_c7_666a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l571_c7_91bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l568_c7_506c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l568_c7_506c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_cond;
     tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_return_output := tmp16_MUX_uxn_opcodes_h_l568_c7_506c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l571_c7_91bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;

     -- n16_MUX[uxn_opcodes_h_l563_c7_666a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l563_c7_666a_cond <= VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_cond;
     n16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue;
     n16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_return_output := n16_MUX_uxn_opcodes_h_l563_c7_666a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l568_c7_506c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l560_c7_832f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l563_c7_666a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_832f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l568_c7_506c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l568_c7_506c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l571_c7_91bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l568_c7_506c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l568_c7_506c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l554_c2_52b6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l563_c7_666a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_return_output;

     -- n16_MUX[uxn_opcodes_h_l560_c7_832f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l560_c7_832f_cond <= VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_cond;
     n16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue;
     n16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_return_output := n16_MUX_uxn_opcodes_h_l560_c7_832f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l563_c7_666a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l568_c7_506c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_return_output := result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l568_c7_506c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l560_c7_832f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l563_c7_666a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l563_c7_666a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_cond;
     tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_return_output := tmp16_MUX_uxn_opcodes_h_l563_c7_666a_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l560_c7_832f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l568_c7_506c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l568_c7_506c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l563_c7_666a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l563_c7_666a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l568_c7_506c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l563_c7_666a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l560_c7_832f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l560_c7_832f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l563_c7_666a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_return_output := result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l563_c7_666a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l563_c7_666a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l554_c2_52b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;

     -- n16_MUX[uxn_opcodes_h_l554_c2_52b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l554_c2_52b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_cond;
     n16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue;
     n16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output := n16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l560_c7_832f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l560_c7_832f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_cond;
     tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_return_output := tmp16_MUX_uxn_opcodes_h_l560_c7_832f_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l563_c7_666a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l563_c7_666a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_832f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_832f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l563_c7_666a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l560_c7_832f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l554_c2_52b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l554_c2_52b6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_cond;
     tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output := tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l560_c7_832f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l560_c7_832f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_return_output := result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l560_c7_832f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l554_c2_52b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_832f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l560_c7_832f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l560_c7_832f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l554_c2_52b6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l554_c2_52b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l554_c2_52b6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_return_output := result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l550_l608_DUPLICATE_f88d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l550_l608_DUPLICATE_f88d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l554_c2_52b6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l554_c2_52b6_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l550_l608_DUPLICATE_f88d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l550_l608_DUPLICATE_f88d_return_output;
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
