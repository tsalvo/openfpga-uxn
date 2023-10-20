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
-- Submodules: 105
entity mul2_0CLK_e3a03e27 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_e3a03e27;
architecture arch of mul2_0CLK_e3a03e27 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2131_c6_9dfd]
signal BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2131_c2_734f]
signal tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2131_c2_734f]
signal n16_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2131_c2_734f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2131_c2_734f]
signal result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2131_c2_734f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2131_c2_734f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2131_c2_734f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2131_c2_734f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2131_c2_734f]
signal t16_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_f4ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2136_c7_f567]
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2136_c7_f567]
signal n16_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_f567]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2136_c7_f567]
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_f567]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_f567]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_f567]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2136_c7_f567]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2136_c7_f567]
signal t16_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2139_c11_e425]
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2139_c7_1543]
signal tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2139_c7_1543]
signal n16_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2139_c7_1543]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2139_c7_1543]
signal result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2139_c7_1543]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2139_c7_1543]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2139_c7_1543]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2139_c7_1543]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2139_c7_1543]
signal t16_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_bbf1]
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2144_c7_907c]
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2144_c7_907c]
signal n16_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_907c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2144_c7_907c]
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2144_c7_907c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_907c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_907c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2144_c7_907c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2144_c7_907c]
signal t16_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2147_c11_36e5]
signal BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2147_c7_3d75]
signal tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2147_c7_3d75]
signal n16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2147_c7_3d75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2147_c7_3d75]
signal result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2147_c7_3d75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2147_c7_3d75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2147_c7_3d75]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2147_c7_3d75]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2147_c7_3d75]
signal t16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2148_c3_149e]
signal BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2151_c11_6b5c]
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2151_c7_046e]
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2151_c7_046e]
signal n16_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2151_c7_046e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2151_c7_046e]
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2151_c7_046e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2151_c7_046e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2151_c7_046e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2151_c7_046e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2154_c11_fa5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2154_c7_f72e]
signal tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2154_c7_f72e]
signal n16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2154_c7_f72e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2154_c7_f72e]
signal result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2154_c7_f72e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2154_c7_f72e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2154_c7_f72e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2154_c7_f72e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2159_c11_7671]
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2159_c7_d8ab]
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2159_c7_d8ab]
signal n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2159_c7_d8ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2159_c7_d8ab]
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2159_c7_d8ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2159_c7_d8ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2159_c7_d8ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2159_c7_d8ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2162_c11_b1e8]
signal BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2162_c7_651a]
signal tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2162_c7_651a]
signal n16_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2162_c7_651a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2162_c7_651a]
signal result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2162_c7_651a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2162_c7_651a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2162_c7_651a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2162_c7_651a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2163_c3_3ed6]
signal BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2164_c11_cb47]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2166_c30_c9d8]
signal sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2171_c11_d606]
signal BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2171_c7_298a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2171_c7_298a]
signal result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2171_c7_298a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2171_c7_298a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2171_c7_298a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2174_c31_6266]
signal CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2176_c11_2a19]
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2176_c7_dfd1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c7_dfd1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd
BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_left,
BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_right,
BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2131_c2_734f
tmp16_MUX_uxn_opcodes_h_l2131_c2_734f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_cond,
tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output);

-- n16_MUX_uxn_opcodes_h_l2131_c2_734f
n16_MUX_uxn_opcodes_h_l2131_c2_734f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2131_c2_734f_cond,
n16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue,
n16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse,
n16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f
result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f
result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f
result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f
result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output);

-- t16_MUX_uxn_opcodes_h_l2131_c2_734f
t16_MUX_uxn_opcodes_h_l2131_c2_734f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2131_c2_734f_cond,
t16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue,
t16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse,
t16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2136_c7_f567
tmp16_MUX_uxn_opcodes_h_l2136_c7_f567 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_cond,
tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue,
tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse,
tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output);

-- n16_MUX_uxn_opcodes_h_l2136_c7_f567
n16_MUX_uxn_opcodes_h_l2136_c7_f567 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2136_c7_f567_cond,
n16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue,
n16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse,
n16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_cond,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output);

-- t16_MUX_uxn_opcodes_h_l2136_c7_f567
t16_MUX_uxn_opcodes_h_l2136_c7_f567 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2136_c7_f567_cond,
t16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue,
t16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse,
t16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_left,
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_right,
BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2139_c7_1543
tmp16_MUX_uxn_opcodes_h_l2139_c7_1543 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_cond,
tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue,
tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse,
tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output);

-- n16_MUX_uxn_opcodes_h_l2139_c7_1543
n16_MUX_uxn_opcodes_h_l2139_c7_1543 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2139_c7_1543_cond,
n16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue,
n16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse,
n16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543
result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_cond,
result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543
result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543
result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output);

-- t16_MUX_uxn_opcodes_h_l2139_c7_1543
t16_MUX_uxn_opcodes_h_l2139_c7_1543 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2139_c7_1543_cond,
t16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue,
t16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse,
t16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_left,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_right,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2144_c7_907c
tmp16_MUX_uxn_opcodes_h_l2144_c7_907c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_cond,
tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output);

-- n16_MUX_uxn_opcodes_h_l2144_c7_907c
n16_MUX_uxn_opcodes_h_l2144_c7_907c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2144_c7_907c_cond,
n16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue,
n16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse,
n16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output);

-- t16_MUX_uxn_opcodes_h_l2144_c7_907c
t16_MUX_uxn_opcodes_h_l2144_c7_907c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2144_c7_907c_cond,
t16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue,
t16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse,
t16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_left,
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_right,
BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75
tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond,
tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue,
tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse,
tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output);

-- n16_MUX_uxn_opcodes_h_l2147_c7_3d75
n16_MUX_uxn_opcodes_h_l2147_c7_3d75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond,
n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue,
n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse,
n16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75
result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_cond,
result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output);

-- t16_MUX_uxn_opcodes_h_l2147_c7_3d75
t16_MUX_uxn_opcodes_h_l2147_c7_3d75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond,
t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue,
t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse,
t16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e
BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_left,
BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_right,
BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_left,
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_right,
BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2151_c7_046e
tmp16_MUX_uxn_opcodes_h_l2151_c7_046e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_cond,
tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output);

-- n16_MUX_uxn_opcodes_h_l2151_c7_046e
n16_MUX_uxn_opcodes_h_l2151_c7_046e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2151_c7_046e_cond,
n16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue,
n16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse,
n16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e
tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond,
tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output);

-- n16_MUX_uxn_opcodes_h_l2154_c7_f72e
n16_MUX_uxn_opcodes_h_l2154_c7_f72e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond,
n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue,
n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse,
n16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e
result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_left,
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_right,
BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab
tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond,
tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output);

-- n16_MUX_uxn_opcodes_h_l2159_c7_d8ab
n16_MUX_uxn_opcodes_h_l2159_c7_d8ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond,
n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue,
n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse,
n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8
BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_left,
BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_right,
BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2162_c7_651a
tmp16_MUX_uxn_opcodes_h_l2162_c7_651a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_cond,
tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output);

-- n16_MUX_uxn_opcodes_h_l2162_c7_651a
n16_MUX_uxn_opcodes_h_l2162_c7_651a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2162_c7_651a_cond,
n16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue,
n16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse,
n16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a
result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a
result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a
result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a
result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6
BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_left,
BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_right,
BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8
sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_ins,
sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_x,
sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_y,
sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_left,
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_right,
BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a
result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a
result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2174_c31_6266
CONST_SR_8_uxn_opcodes_h_l2174_c31_6266 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_x,
CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_left,
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_right,
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1
result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2
CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
 n16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
 t16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output,
 n16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output,
 t16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output,
 tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output,
 n16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output,
 t16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output,
 n16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output,
 t16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output,
 n16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output,
 t16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output,
 n16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output,
 n16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output,
 tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output,
 n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output,
 n16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_return_output,
 sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_return_output,
 CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2133_c3_8b9c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2137_c3_369b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_2b45 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2145_c3_7c7f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_baff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_1797 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_40fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_3d3a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2164_c3_06ed : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2168_c3_57ce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2169_c21_eea4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2173_c3_7ada : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2171_c7_298a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2174_c21_3d19_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2140_l2148_l2155_l2163_DUPLICATE_d88a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2181_l2127_DUPLICATE_f0da_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_3d3a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_3d3a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2137_c3_369b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2137_c3_369b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_2b45 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2142_c3_2b45;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_1797 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_1797;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2168_c3_57ce := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2168_c3_57ce;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_40fe := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2157_c3_40fe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2145_c3_7c7f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2145_c3_7c7f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2133_c3_8b9c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2133_c3_8b9c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2173_c3_7ada := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2173_c3_7ada;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_baff := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2149_c3_baff;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2154_c11_fa5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2171_c11_d606] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_left;
     BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_return_output := BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2159_c11_7671] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_left;
     BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output := BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_bbf1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2171_c7_298a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2171_c7_298a_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l2174_c31_6266] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_return_output := CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2139_c11_e425] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_left;
     BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output := BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l2166_c30_c9d8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_ins;
     sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_x;
     sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_return_output := sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2162_c11_b1e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2147_c11_36e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2131_c6_9dfd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2176_c11_2a19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_left;
     BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_return_output := BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2151_c11_6b5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_f4ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2140_l2148_l2155_l2163_DUPLICATE_d88a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2140_l2148_l2155_l2163_DUPLICATE_d88a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c6_9dfd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_f4ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2139_c11_e425_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_bbf1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2147_c11_36e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2151_c11_6b5c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2154_c11_fa5a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2159_c11_7671_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2162_c11_b1e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2171_c11_d606_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_2a19_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2140_l2148_l2155_l2163_DUPLICATE_d88a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2140_l2148_l2155_l2163_DUPLICATE_d88a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2140_l2148_l2155_l2163_DUPLICATE_d88a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2144_l2139_l2162_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_af4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2162_l2136_l2159_l2154_l2151_l2147_l2176_DUPLICATE_ee28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_4628_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_l2176_DUPLICATE_58e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2144_l2171_l2139_l2136_l2159_l2131_l2154_l2151_l2147_DUPLICATE_02a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2171_c7_298a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2166_c30_c9d8_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c7_dfd1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2176_c7_dfd1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2163_c3_3ed6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_left;
     BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_return_output := BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2171_c7_298a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2174_c21_3d19] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2174_c21_3d19_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2174_c31_6266_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2162_c7_651a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2171_c7_298a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2148_c3_149e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_left;
     BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_return_output := BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2148_c3_149e_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2163_c3_3ed6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2174_c21_3d19_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2141_l2156_DUPLICATE_a8c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2171_c7_298a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_dfd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2171_c7_298a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2171_c7_298a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2162_c7_651a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2162_c7_651a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2162_c7_651a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_cond;
     n16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue;
     n16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output := n16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2162_c7_651a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2159_c7_d8ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2164_c11_cb47] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2171_c7_298a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2171_c7_298a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2147_c7_3d75] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond <= VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond;
     t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue;
     t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output := t16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2164_c3_06ed := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2164_c11_cb47_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2171_c7_298a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2171_c7_298a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2171_c7_298a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue := VAR_tmp16_uxn_opcodes_h_l2164_c3_06ed;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2159_c7_d8ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;

     -- n16_MUX[uxn_opcodes_h_l2159_c7_d8ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond;
     n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue;
     n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output := n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2159_c7_d8ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2154_c7_f72e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2162_c7_651a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2162_c7_651a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2144_c7_907c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2144_c7_907c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_cond;
     t16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue;
     t16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output := t16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2169_c21_eea4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2169_c21_eea4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2164_c3_06ed);

     -- tmp16_MUX[uxn_opcodes_h_l2162_c7_651a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_cond;
     tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output := tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2169_c21_eea4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2154_c7_f72e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2159_c7_d8ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2162_c7_651a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2159_c7_d8ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond;
     tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output := tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;

     -- t16_MUX[uxn_opcodes_h_l2139_c7_1543] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2139_c7_1543_cond <= VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_cond;
     t16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue;
     t16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output := t16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2159_c7_d8ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2151_c7_046e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2154_c7_f72e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2154_c7_f72e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond;
     n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue;
     n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output := n16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2162_c7_651a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2151_c7_046e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2151_c7_046e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2151_c7_046e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_cond;
     n16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue;
     n16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output := n16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2154_c7_f72e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2154_c7_f72e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_cond;
     tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output := tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2151_c7_046e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2147_c7_3d75] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2154_c7_f72e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2136_c7_f567] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2136_c7_f567_cond <= VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_cond;
     t16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue;
     t16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output := t16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2159_c7_d8ab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output := result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2159_c7_d8ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;
     -- n16_MUX[uxn_opcodes_h_l2147_c7_3d75] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond <= VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond;
     n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue;
     n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output := n16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2151_c7_046e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2154_c7_f72e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2151_c7_046e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2151_c7_046e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_cond;
     tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output := tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2131_c2_734f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2131_c2_734f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_cond;
     t16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue;
     t16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output := t16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2147_c7_3d75] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2147_c7_3d75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_907c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2154_c7_f72e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2144_c7_907c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2151_c7_046e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2144_c7_907c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2144_c7_907c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_cond;
     n16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue;
     n16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output := n16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2147_c7_3d75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2147_c7_3d75] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_cond;
     tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output := tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_907c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2147_c7_3d75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2139_c7_1543] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2151_c7_046e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2144_c7_907c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_f567] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2139_c7_1543] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;

     -- n16_MUX[uxn_opcodes_h_l2139_c7_1543] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2139_c7_1543_cond <= VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_cond;
     n16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue;
     n16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output := n16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2139_c7_1543] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2147_c7_3d75] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output := result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2144_c7_907c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_cond;
     tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output := tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_907c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2147_c7_3d75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2139_c7_1543] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_cond;
     tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output := tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2136_c7_f567] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2144_c7_907c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_f567] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;

     -- n16_MUX[uxn_opcodes_h_l2136_c7_f567] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2136_c7_f567_cond <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_cond;
     n16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue;
     n16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output := n16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2139_c7_1543] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2139_c7_1543] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2131_c2_734f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_907c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2131_c2_734f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2136_c7_f567] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_cond;
     tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output := tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_f567] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2131_c2_734f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2139_c7_1543] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_return_output := result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_f567] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;

     -- n16_MUX[uxn_opcodes_h_l2131_c2_734f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2131_c2_734f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_cond;
     n16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue;
     n16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output := n16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2139_c7_1543_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2131_c2_734f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2136_c7_f567] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_return_output := result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2131_c2_734f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2131_c2_734f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_cond;
     tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output := tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_f567_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2131_c2_734f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2181_l2127_DUPLICATE_f0da LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2181_l2127_DUPLICATE_f0da_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c2_734f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2181_l2127_DUPLICATE_f0da_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2181_l2127_DUPLICATE_f0da_return_output;
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
