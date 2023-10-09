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
-- Submodules: 125
entity div2_0CLK_444c40b9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_444c40b9;
architecture arch of div2_0CLK_444c40b9 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2388_c6_c507]
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2388_c1_0a66]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2388_c2_90a6]
signal t16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2388_c2_90a6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c2_90a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2388_c2_90a6]
signal result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2388_c2_90a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2388_c2_90a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c2_90a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2388_c2_90a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2388_c2_90a6]
signal tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2388_c2_90a6]
signal n16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2389_c3_5a4d[uxn_opcodes_h_l2389_c3_5a4d]
signal printf_uxn_opcodes_h_l2389_c3_5a4d_uxn_opcodes_h_l2389_c3_5a4d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2394_c11_3c1a]
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2394_c7_bfa2]
signal t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2394_c7_bfa2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2394_c7_bfa2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2394_c7_bfa2]
signal result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2394_c7_bfa2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2394_c7_bfa2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2394_c7_bfa2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2394_c7_bfa2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2394_c7_bfa2]
signal tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2394_c7_bfa2]
signal n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_d94a]
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2397_c7_6af9]
signal t16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2397_c7_6af9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2397_c7_6af9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2397_c7_6af9]
signal result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_6af9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_6af9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_6af9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_6af9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2397_c7_6af9]
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2397_c7_6af9]
signal n16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_d061]
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2402_c7_877a]
signal t16_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2402_c7_877a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_877a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2402_c7_877a]
signal result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2402_c7_877a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_877a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_877a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_877a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2402_c7_877a]
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2402_c7_877a]
signal n16_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2405_c11_5044]
signal BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2405_c7_10d7]
signal t16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2405_c7_10d7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2405_c7_10d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2405_c7_10d7]
signal result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2405_c7_10d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2405_c7_10d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2405_c7_10d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2405_c7_10d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2405_c7_10d7]
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2405_c7_10d7]
signal n16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2406_c3_cd5c]
signal BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2409_c11_87db]
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2409_c7_1bfd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2409_c7_1bfd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2409_c7_1bfd]
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2409_c7_1bfd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2409_c7_1bfd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2409_c7_1bfd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2409_c7_1bfd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2409_c7_1bfd]
signal tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2409_c7_1bfd]
signal n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2412_c11_0304]
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2412_c7_34b5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2412_c7_34b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2412_c7_34b5]
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2412_c7_34b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2412_c7_34b5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2412_c7_34b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2412_c7_34b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2412_c7_34b5]
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2412_c7_34b5]
signal n16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2417_c11_b53d]
signal BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2417_c7_f27f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2417_c7_f27f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2417_c7_f27f]
signal result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2417_c7_f27f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2417_c7_f27f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2417_c7_f27f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2417_c7_f27f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2417_c7_f27f]
signal tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2417_c7_f27f]
signal n16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2420_c11_32a4]
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2420_c7_648d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c7_648d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2420_c7_648d]
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2420_c7_648d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c7_648d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c7_648d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c7_648d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2420_c7_648d]
signal tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2420_c7_648d]
signal n16_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2421_c3_7da9]
signal BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2422_c11_8758]
signal BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2422_c26_b4d4]
signal BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2422_c11_279e]
signal MUX_uxn_opcodes_h_l2422_c11_279e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2422_c11_279e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2422_c11_279e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2422_c11_279e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2425_c32_5cc7]
signal BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2425_c32_c12b]
signal BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2425_c32_7c09]
signal MUX_uxn_opcodes_h_l2425_c32_7c09_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2425_c32_7c09_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2425_c32_7c09_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2425_c32_7c09_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2427_c11_fa20]
signal BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2427_c7_65d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2427_c7_65d8]
signal result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2427_c7_65d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2427_c7_65d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2427_c7_65d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2433_c11_cdcf]
signal BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2433_c7_672d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2433_c7_672d]
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2433_c7_672d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2433_c7_672d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2435_c34_27cd]
signal CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2437_c11_3da9]
signal BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2437_c7_e8f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2437_c7_e8f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507
BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_left,
BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_right,
BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_return_output);

-- t16_MUX_uxn_opcodes_h_l2388_c2_90a6
t16_MUX_uxn_opcodes_h_l2388_c2_90a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond,
t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue,
t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse,
t16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6
result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6
result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6
tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond,
tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output);

-- n16_MUX_uxn_opcodes_h_l2388_c2_90a6
n16_MUX_uxn_opcodes_h_l2388_c2_90a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond,
n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue,
n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse,
n16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output);

-- printf_uxn_opcodes_h_l2389_c3_5a4d_uxn_opcodes_h_l2389_c3_5a4d
printf_uxn_opcodes_h_l2389_c3_5a4d_uxn_opcodes_h_l2389_c3_5a4d : entity work.printf_uxn_opcodes_h_l2389_c3_5a4d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2389_c3_5a4d_uxn_opcodes_h_l2389_c3_5a4d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_left,
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_right,
BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output);

-- t16_MUX_uxn_opcodes_h_l2394_c7_bfa2
t16_MUX_uxn_opcodes_h_l2394_c7_bfa2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond,
t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue,
t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse,
t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2
result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2
result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2
result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2
result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2
tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond,
tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output);

-- n16_MUX_uxn_opcodes_h_l2394_c7_bfa2
n16_MUX_uxn_opcodes_h_l2394_c7_bfa2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond,
n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue,
n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse,
n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_left,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_right,
BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output);

-- t16_MUX_uxn_opcodes_h_l2397_c7_6af9
t16_MUX_uxn_opcodes_h_l2397_c7_6af9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond,
t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue,
t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse,
t16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9
result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9
result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9
tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond,
tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output);

-- n16_MUX_uxn_opcodes_h_l2397_c7_6af9
n16_MUX_uxn_opcodes_h_l2397_c7_6af9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond,
n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue,
n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse,
n16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_left,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_right,
BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output);

-- t16_MUX_uxn_opcodes_h_l2402_c7_877a
t16_MUX_uxn_opcodes_h_l2402_c7_877a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2402_c7_877a_cond,
t16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue,
t16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse,
t16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a
result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a
result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2402_c7_877a
tmp16_MUX_uxn_opcodes_h_l2402_c7_877a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_cond,
tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output);

-- n16_MUX_uxn_opcodes_h_l2402_c7_877a
n16_MUX_uxn_opcodes_h_l2402_c7_877a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2402_c7_877a_cond,
n16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue,
n16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse,
n16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_left,
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_right,
BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output);

-- t16_MUX_uxn_opcodes_h_l2405_c7_10d7
t16_MUX_uxn_opcodes_h_l2405_c7_10d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond,
t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue,
t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse,
t16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7
result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7
result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7
tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond,
tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output);

-- n16_MUX_uxn_opcodes_h_l2405_c7_10d7
n16_MUX_uxn_opcodes_h_l2405_c7_10d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond,
n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue,
n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse,
n16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c
BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_left,
BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_right,
BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_left,
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_right,
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd
result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd
tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond,
tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue,
tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse,
tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output);

-- n16_MUX_uxn_opcodes_h_l2409_c7_1bfd
n16_MUX_uxn_opcodes_h_l2409_c7_1bfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond,
n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue,
n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse,
n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_left,
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_right,
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5
result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5
tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond,
tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue,
tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse,
tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output);

-- n16_MUX_uxn_opcodes_h_l2412_c7_34b5
n16_MUX_uxn_opcodes_h_l2412_c7_34b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond,
n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue,
n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse,
n16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d
BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_left,
BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_right,
BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f
result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f
result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f
result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f
result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f
result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f
tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond,
tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output);

-- n16_MUX_uxn_opcodes_h_l2417_c7_f27f
n16_MUX_uxn_opcodes_h_l2417_c7_f27f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond,
n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue,
n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse,
n16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_left,
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_right,
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2420_c7_648d
tmp16_MUX_uxn_opcodes_h_l2420_c7_648d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_cond,
tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output);

-- n16_MUX_uxn_opcodes_h_l2420_c7_648d
n16_MUX_uxn_opcodes_h_l2420_c7_648d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2420_c7_648d_cond,
n16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue,
n16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse,
n16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9
BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_left,
BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_right,
BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758
BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_left,
BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_right,
BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4
BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_left,
BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_right,
BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_return_output);

-- MUX_uxn_opcodes_h_l2422_c11_279e
MUX_uxn_opcodes_h_l2422_c11_279e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2422_c11_279e_cond,
MUX_uxn_opcodes_h_l2422_c11_279e_iftrue,
MUX_uxn_opcodes_h_l2422_c11_279e_iffalse,
MUX_uxn_opcodes_h_l2422_c11_279e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7
BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_left,
BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_right,
BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b
BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_left,
BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_right,
BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_return_output);

-- MUX_uxn_opcodes_h_l2425_c32_7c09
MUX_uxn_opcodes_h_l2425_c32_7c09 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2425_c32_7c09_cond,
MUX_uxn_opcodes_h_l2425_c32_7c09_iftrue,
MUX_uxn_opcodes_h_l2425_c32_7c09_iffalse,
MUX_uxn_opcodes_h_l2425_c32_7c09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20
BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_left,
BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_right,
BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8
result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8
result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8
result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8
result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf
BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_left,
BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_right,
BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d
result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd
CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_x,
CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9
BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_left,
BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_right,
BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2
result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453
CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_return_output,
 t16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
 n16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output,
 t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output,
 n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output,
 t16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output,
 n16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output,
 t16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output,
 n16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output,
 t16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output,
 n16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output,
 n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output,
 n16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output,
 n16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output,
 n16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_return_output,
 MUX_uxn_opcodes_h_l2422_c11_279e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_return_output,
 MUX_uxn_opcodes_h_l2425_c32_7c09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_return_output,
 CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2391_c3_b4ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2389_c3_5a4d_uxn_opcodes_h_l2389_c3_5a4d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2395_c3_2ec4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_a2f0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2403_c3_f38e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_eb29 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_b3cb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2415_c3_9910 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_c23c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2422_c11_279e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2422_c11_279e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2422_c11_279e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2422_c11_279e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2430_c3_bb58 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2431_c24_f2bd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2434_c3_6b4c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2435_c24_68f6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2412_l2409_DUPLICATE_2770_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2406_l2421_l2413_l2398_DUPLICATE_aec7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2433_l2420_DUPLICATE_6a86_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2384_l2442_DUPLICATE_5672_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_b3cb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_b3cb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_c23c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_c23c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2430_c3_bb58 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2430_c3_bb58;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_right := to_unsigned(11, 4);
     VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_eb29 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2407_c3_eb29;
     VAR_MUX_uxn_opcodes_h_l2422_c11_279e_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2403_c3_f38e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2403_c3_f38e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_right := to_unsigned(9, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2391_c3_b4ad := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2391_c3_b4ad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2415_c3_9910 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2415_c3_9910;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_a2f0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2400_c3_a2f0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2395_c3_2ec4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2395_c3_2ec4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2434_c3_6b4c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2434_c3_6b4c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse := tmp16;
     -- BIN_OP_AND[uxn_opcodes_h_l2425_c32_5cc7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_left;
     BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_return_output := BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2406_l2421_l2413_l2398_DUPLICATE_aec7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2406_l2421_l2413_l2398_DUPLICATE_aec7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2431_c24_f2bd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2431_c24_f2bd_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2422_c11_8758] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_left;
     BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_return_output := BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2394_c11_3c1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2433_l2420_DUPLICATE_6a86 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2433_l2420_DUPLICATE_6a86_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2412_c11_0304] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_left;
     BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output := BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2405_c11_5044] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_left;
     BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output := BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2409_c11_87db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2433_c11_cdcf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2437_c11_3da9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2420_c11_32a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2417_c11_b53d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2435_c34_27cd] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_return_output := CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2427_c11_fa20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_left;
     BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_return_output := BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2402_c11_d061] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_left;
     BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output := BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2412_l2409_DUPLICATE_2770 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2412_l2409_DUPLICATE_2770_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2397_c11_d94a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2388_c6_c507] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_left;
     BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output := BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c32_5cc7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c6_c507_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2394_c11_3c1a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2397_c11_d94a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2402_c11_d061_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2405_c11_5044_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_87db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_0304_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2417_c11_b53d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_32a4_return_output;
     VAR_MUX_uxn_opcodes_h_l2422_c11_279e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2422_c11_8758_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2427_c11_fa20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2433_c11_cdcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c11_3da9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2406_l2421_l2413_l2398_DUPLICATE_aec7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2406_l2421_l2413_l2398_DUPLICATE_aec7_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2406_l2421_l2413_l2398_DUPLICATE_aec7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2431_c24_f2bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_9413_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2427_l2397_l2420_l2394_l2417_l2412_l2409_l2437_DUPLICATE_18b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2405_l2402_l2427_l2397_l2394_l2417_l2388_l2412_l2409_DUPLICATE_7950_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2412_l2409_DUPLICATE_2770_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2412_l2409_DUPLICATE_2770_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2412_l2409_DUPLICATE_2770_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2412_l2409_DUPLICATE_2770_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2412_l2409_DUPLICATE_2770_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2412_l2409_DUPLICATE_2770_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2412_l2409_DUPLICATE_2770_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2405_l2402_l2397_l2420_l2394_l2417_l2412_l2409_DUPLICATE_2770_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_l2437_DUPLICATE_8121_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2433_l2420_DUPLICATE_6a86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2433_l2420_DUPLICATE_6a86_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2405_l2433_l2402_l2397_l2420_l2394_l2417_l2388_l2412_l2409_DUPLICATE_3fd0_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2420_c7_648d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2433_c7_672d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2427_c7_65d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2437_c7_e8f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2435_c24_68f6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2435_c24_68f6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2435_c34_27cd_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2421_c3_7da9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_left;
     BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_return_output := BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2437_c7_e8f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2425_c32_c12b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_left;
     BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_return_output := BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2406_c3_cd5c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_left;
     BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_return_output := BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2388_c1_0a66] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2425_c32_c12b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2406_c3_cd5c_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2421_c3_7da9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2435_c24_68f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2414_l2399_DUPLICATE_5453_return_output;
     VAR_printf_uxn_opcodes_h_l2389_c3_5a4d_uxn_opcodes_h_l2389_c3_5a4d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2388_c1_0a66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2437_c7_e8f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2433_c7_672d_return_output;
     -- BIN_OP_DIV[uxn_opcodes_h_l2422_c26_b4d4] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_left;
     BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_return_output := BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2427_c7_65d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output;

     -- printf_uxn_opcodes_h_l2389_c3_5a4d[uxn_opcodes_h_l2389_c3_5a4d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2389_c3_5a4d_uxn_opcodes_h_l2389_c3_5a4d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2389_c3_5a4d_uxn_opcodes_h_l2389_c3_5a4d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2433_c7_672d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2420_c7_648d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2433_c7_672d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_return_output;

     -- MUX[uxn_opcodes_h_l2425_c32_7c09] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2425_c32_7c09_cond <= VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_cond;
     MUX_uxn_opcodes_h_l2425_c32_7c09_iftrue <= VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_iftrue;
     MUX_uxn_opcodes_h_l2425_c32_7c09_iffalse <= VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_return_output := MUX_uxn_opcodes_h_l2425_c32_7c09_return_output;

     -- n16_MUX[uxn_opcodes_h_l2420_c7_648d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2420_c7_648d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_cond;
     n16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue;
     n16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output := n16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2405_c7_10d7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond;
     t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue;
     t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output := t16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2433_c7_672d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2417_c7_f27f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2422_c11_279e_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2422_c26_b4d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue := VAR_MUX_uxn_opcodes_h_l2425_c32_7c09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2433_c7_672d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2433_c7_672d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2433_c7_672d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;
     -- t16_MUX[uxn_opcodes_h_l2402_c7_877a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2402_c7_877a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_cond;
     t16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue;
     t16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output := t16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2412_c7_34b5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;

     -- MUX[uxn_opcodes_h_l2422_c11_279e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2422_c11_279e_cond <= VAR_MUX_uxn_opcodes_h_l2422_c11_279e_cond;
     MUX_uxn_opcodes_h_l2422_c11_279e_iftrue <= VAR_MUX_uxn_opcodes_h_l2422_c11_279e_iftrue;
     MUX_uxn_opcodes_h_l2422_c11_279e_iffalse <= VAR_MUX_uxn_opcodes_h_l2422_c11_279e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2422_c11_279e_return_output := MUX_uxn_opcodes_h_l2422_c11_279e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2417_c7_f27f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond;
     n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue;
     n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output := n16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2417_c7_f27f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c7_648d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2427_c7_65d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2427_c7_65d8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c7_648d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2427_c7_65d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue := VAR_MUX_uxn_opcodes_h_l2422_c11_279e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2427_c7_65d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;
     -- n16_MUX[uxn_opcodes_h_l2412_c7_34b5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond;
     n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue;
     n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output := n16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2412_c7_34b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c7_648d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2420_c7_648d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_cond;
     tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output := tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2420_c7_648d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2417_c7_f27f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c7_648d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2397_c7_6af9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond;
     t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue;
     t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output := t16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2409_c7_1bfd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2417_c7_f27f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2420_c7_648d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2412_c7_34b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2417_c7_f27f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2417_c7_f27f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_cond;
     tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output := tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2412_c7_34b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2417_c7_f27f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2409_c7_1bfd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2409_c7_1bfd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond;
     n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue;
     n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output := n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2417_c7_f27f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2405_c7_10d7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2394_c7_bfa2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond;
     t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue;
     t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output := t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2417_c7_f27f_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2402_c7_877a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2412_c7_34b5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2409_c7_1bfd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2405_c7_10d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond;
     n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue;
     n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output := n16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2412_c7_34b5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2412_c7_34b5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_cond;
     tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output := tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2409_c7_1bfd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2388_c2_90a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond;
     t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue;
     t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output := t16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2412_c7_34b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2405_c7_10d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2412_c7_34b5_return_output;
     -- n16_MUX[uxn_opcodes_h_l2402_c7_877a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2402_c7_877a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_cond;
     n16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue;
     n16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output := n16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2402_c7_877a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2397_c7_6af9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2405_c7_10d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2409_c7_1bfd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2409_c7_1bfd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond;
     tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output := tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2409_c7_1bfd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2409_c7_1bfd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2405_c7_10d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2409_c7_1bfd_return_output;
     -- n16_MUX[uxn_opcodes_h_l2397_c7_6af9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond;
     n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue;
     n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output := n16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2402_c7_877a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2405_c7_10d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2397_c7_6af9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2402_c7_877a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2405_c7_10d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_cond;
     tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output := tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2405_c7_10d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2394_c7_bfa2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2405_c7_10d7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2405_c7_10d7_return_output;
     -- n16_MUX[uxn_opcodes_h_l2394_c7_bfa2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond;
     n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue;
     n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output := n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2394_c7_bfa2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2388_c2_90a6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2397_c7_6af9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2402_c7_877a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2402_c7_877a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2397_c7_6af9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2402_c7_877a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_cond;
     tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output := tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2402_c7_877a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2402_c7_877a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2394_c7_bfa2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2394_c7_bfa2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2388_c2_90a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond;
     n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue;
     n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output := n16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2397_c7_6af9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_cond;
     tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output := tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2397_c7_6af9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2388_c2_90a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2397_c7_6af9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2397_c7_6af9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2397_c7_6af9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c2_90a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2388_c2_90a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2394_c7_bfa2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2394_c7_bfa2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2394_c7_bfa2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond;
     tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output := tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2394_c7_bfa2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2394_c7_bfa2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c2_90a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2388_c2_90a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_cond;
     tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output := tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2388_c2_90a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2388_c2_90a6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;

     -- Submodule level 13
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2384_l2442_DUPLICATE_5672 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2384_l2442_DUPLICATE_5672_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c2_90a6_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2384_l2442_DUPLICATE_5672_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2384_l2442_DUPLICATE_5672_return_output;
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
