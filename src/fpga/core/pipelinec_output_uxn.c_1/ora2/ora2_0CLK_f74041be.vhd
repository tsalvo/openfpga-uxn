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
-- Submodules: 79
entity ora2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_f74041be;
architecture arch of ora2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l988_c6_e163]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l988_c1_dda9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l988_c2_9705]
signal n16_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l988_c2_9705]
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c2_9705]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c2_9705]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c2_9705]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c2_9705]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c2_9705]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l988_c2_9705]
signal t16_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l988_c2_9705]
signal tmp16_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l989_c3_2fee[uxn_opcodes_h_l989_c3_2fee]
signal printf_uxn_opcodes_h_l989_c3_2fee_uxn_opcodes_h_l989_c3_2fee_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l993_c11_aac3]
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l993_c7_f9b8]
signal n16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l993_c7_f9b8]
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_f9b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_f9b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_f9b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_f9b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_f9b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l993_c7_f9b8]
signal t16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l993_c7_f9b8]
signal tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l996_c11_ba1b]
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l996_c7_c789]
signal n16_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l996_c7_c789]
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_c789]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_c789]
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_c789]
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_c789]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_c789]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l996_c7_c789]
signal t16_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l996_c7_c789]
signal tmp16_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_477e]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1001_c7_b9a4]
signal n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_b9a4]
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_b9a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_b9a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_b9a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_b9a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_b9a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1001_c7_b9a4]
signal t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1001_c7_b9a4]
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1002_c3_0962]
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_b4c0]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1005_c7_5e56]
signal n16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1005_c7_5e56]
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_5e56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_5e56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_5e56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_5e56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_5e56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1005_c7_5e56]
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_ef18]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1009_c7_c353]
signal n16_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1009_c7_c353]
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_c353]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_c353]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_c353]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_c353]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_c353]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1009_c7_c353]
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1010_c3_5191]
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1011_c11_3b4b]
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1013_c30_b923]
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_5a4c]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1018_c7_f640]
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1018_c7_f640]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_f640]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_f640]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1018_c7_f640]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1021_c31_a401]
signal CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_6bcc]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_5f18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_5f18]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163
BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_return_output);

-- n16_MUX_uxn_opcodes_h_l988_c2_9705
n16_MUX_uxn_opcodes_h_l988_c2_9705 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l988_c2_9705_cond,
n16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue,
n16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse,
n16_MUX_uxn_opcodes_h_l988_c2_9705_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705
result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_cond,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output);

-- t16_MUX_uxn_opcodes_h_l988_c2_9705
t16_MUX_uxn_opcodes_h_l988_c2_9705 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l988_c2_9705_cond,
t16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue,
t16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse,
t16_MUX_uxn_opcodes_h_l988_c2_9705_return_output);

-- tmp16_MUX_uxn_opcodes_h_l988_c2_9705
tmp16_MUX_uxn_opcodes_h_l988_c2_9705 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l988_c2_9705_cond,
tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue,
tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse,
tmp16_MUX_uxn_opcodes_h_l988_c2_9705_return_output);

-- printf_uxn_opcodes_h_l989_c3_2fee_uxn_opcodes_h_l989_c3_2fee
printf_uxn_opcodes_h_l989_c3_2fee_uxn_opcodes_h_l989_c3_2fee : entity work.printf_uxn_opcodes_h_l989_c3_2fee_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l989_c3_2fee_uxn_opcodes_h_l989_c3_2fee_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3
BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_left,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_right,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output);

-- n16_MUX_uxn_opcodes_h_l993_c7_f9b8
n16_MUX_uxn_opcodes_h_l993_c7_f9b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond,
n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue,
n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse,
n16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8
result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output);

-- t16_MUX_uxn_opcodes_h_l993_c7_f9b8
t16_MUX_uxn_opcodes_h_l993_c7_f9b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond,
t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue,
t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse,
t16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8
tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond,
tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue,
tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse,
tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_left,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_right,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output);

-- n16_MUX_uxn_opcodes_h_l996_c7_c789
n16_MUX_uxn_opcodes_h_l996_c7_c789 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l996_c7_c789_cond,
n16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue,
n16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse,
n16_MUX_uxn_opcodes_h_l996_c7_c789_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789
result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_cond,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output);

-- t16_MUX_uxn_opcodes_h_l996_c7_c789
t16_MUX_uxn_opcodes_h_l996_c7_c789 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l996_c7_c789_cond,
t16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue,
t16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse,
t16_MUX_uxn_opcodes_h_l996_c7_c789_return_output);

-- tmp16_MUX_uxn_opcodes_h_l996_c7_c789
tmp16_MUX_uxn_opcodes_h_l996_c7_c789 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l996_c7_c789_cond,
tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue,
tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse,
tmp16_MUX_uxn_opcodes_h_l996_c7_c789_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output);

-- n16_MUX_uxn_opcodes_h_l1001_c7_b9a4
n16_MUX_uxn_opcodes_h_l1001_c7_b9a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond,
n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue,
n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse,
n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output);

-- t16_MUX_uxn_opcodes_h_l1001_c7_b9a4
t16_MUX_uxn_opcodes_h_l1001_c7_b9a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond,
t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue,
t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse,
t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4
tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond,
tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962
BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_left,
BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_right,
BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output);

-- n16_MUX_uxn_opcodes_h_l1005_c7_5e56
n16_MUX_uxn_opcodes_h_l1005_c7_5e56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond,
n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue,
n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse,
n16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_cond,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56
tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond,
tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue,
tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse,
tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output);

-- n16_MUX_uxn_opcodes_h_l1009_c7_c353
n16_MUX_uxn_opcodes_h_l1009_c7_c353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1009_c7_c353_cond,
n16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue,
n16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse,
n16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_cond,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1009_c7_c353
tmp16_MUX_uxn_opcodes_h_l1009_c7_c353 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_cond,
tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue,
tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse,
tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191
BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_left,
BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_right,
BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b
BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_left,
BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_right,
BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1013_c30_b923
sp_relative_shift_uxn_opcodes_h_l1013_c30_b923 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_ins,
sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_x,
sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_y,
sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_cond,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1021_c31_a401
CONST_SR_8_uxn_opcodes_h_l1021_c31_a401 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_x,
CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_return_output,
 n16_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
 t16_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
 tmp16_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output,
 n16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output,
 t16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output,
 tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output,
 n16_MUX_uxn_opcodes_h_l996_c7_c789_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output,
 t16_MUX_uxn_opcodes_h_l996_c7_c789_return_output,
 tmp16_MUX_uxn_opcodes_h_l996_c7_c789_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output,
 n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output,
 t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output,
 n16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output,
 tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output,
 n16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output,
 tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_return_output,
 CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_d692 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l989_c3_2fee_uxn_opcodes_h_l989_c3_2fee_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_7be4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_cd3e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_b401 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_98f7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_ab52_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_c638 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_223f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_eb83_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_963f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l988_l1018_l1005_DUPLICATE_ff84_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1009_l1005_DUPLICATE_3510_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l1018_l1009_l1005_DUPLICATE_60c1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1006_l1002_DUPLICATE_ee22_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1018_l1005_DUPLICATE_5713_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l984_l1028_DUPLICATE_8001_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_d692 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_d692;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_c638 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_c638;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_7be4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_7be4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_cd3e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_cd3e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_b401 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_b401;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_98f7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_98f7;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l988_l1018_l1005_DUPLICATE_ff84 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l988_l1018_l1005_DUPLICATE_ff84_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1009_l1005_DUPLICATE_3510 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1009_l1005_DUPLICATE_3510_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_b4c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l996_c11_ba1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_477e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l988_c6_e163] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_963f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_963f_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1021_c31_a401] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_return_output := CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_5a4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1018_l1005_DUPLICATE_5713 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1018_l1005_DUPLICATE_5713_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l1018_l1009_l1005_DUPLICATE_60c1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l1018_l1009_l1005_DUPLICATE_60c1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l993_c11_aac3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_left;
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output := BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1013_c30_b923] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_ins;
     sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_x;
     sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_return_output := sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1006_l1002_DUPLICATE_ee22 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1006_l1002_DUPLICATE_ee22_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_ef18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_eb83 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_eb83_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_6bcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_477e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_b4c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_ef18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_5a4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_6bcc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_e163_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_aac3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_ba1b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1006_l1002_DUPLICATE_ee22_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1006_l1002_DUPLICATE_ee22_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1010_l1006_l1002_DUPLICATE_ee22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1009_l1005_DUPLICATE_3510_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1009_l1005_DUPLICATE_3510_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1009_l1005_DUPLICATE_3510_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1009_l1005_DUPLICATE_3510_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1009_l1005_DUPLICATE_3510_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1009_l1005_DUPLICATE_3510_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l1018_l1009_l1005_DUPLICATE_60c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l1018_l1009_l1005_DUPLICATE_60c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l1018_l1009_l1005_DUPLICATE_60c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l1018_l1009_l1005_DUPLICATE_60c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l1018_l1009_l1005_DUPLICATE_60c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l1018_l1009_l1005_DUPLICATE_60c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l1018_l1009_l1005_DUPLICATE_60c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_963f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_963f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_963f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_963f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_963f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_963f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l988_l1018_l1005_DUPLICATE_ff84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l988_l1018_l1005_DUPLICATE_ff84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l988_l1018_l1005_DUPLICATE_ff84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l988_l1018_l1005_DUPLICATE_ff84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l988_l1018_l1005_DUPLICATE_ff84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l988_l1018_l1005_DUPLICATE_ff84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1001_l996_l993_l1023_l988_l1018_l1005_DUPLICATE_ff84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1018_l1005_DUPLICATE_5713_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1018_l1005_DUPLICATE_5713_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_eb83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_eb83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_eb83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_eb83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_eb83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1001_l996_l993_l988_l1018_l1005_DUPLICATE_eb83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_b923_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1018_c7_f640] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_c353] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1021_c21_223f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_223f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_a401_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_5f18] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1018_c7_f640] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1002_c3_0962] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_left;
     BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_return_output := BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l988_c1_dda9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1010_c3_5191] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_left;
     BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_return_output := BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_5f18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_0962_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_5191_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_223f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_af9b_return_output;
     VAR_printf_uxn_opcodes_h_l989_c3_2fee_uxn_opcodes_h_l989_c3_2fee_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_dda9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_f640_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_5f18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_f640_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1011_c11_3b4b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_left;
     BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_return_output := BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_c353] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_f640] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_f640] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_return_output;

     -- printf_uxn_opcodes_h_l989_c3_2fee[uxn_opcodes_h_l989_c3_2fee] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l989_c3_2fee_uxn_opcodes_h_l989_c3_2fee_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l989_c3_2fee_uxn_opcodes_h_l989_c3_2fee_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l1018_c7_f640] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_return_output := result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_5e56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;

     -- t16_MUX[uxn_opcodes_h_l1001_c7_b9a4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond;
     t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue;
     t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output := t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1009_c7_c353] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1009_c7_c353_cond <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_cond;
     n16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue;
     n16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output := n16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_c353] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_f640_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_f640_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_f640_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;
     -- n16_MUX[uxn_opcodes_h_l1005_c7_5e56] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond;
     n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue;
     n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output := n16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_b9a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;

     -- t16_MUX[uxn_opcodes_h_l996_c7_c789] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l996_c7_c789_cond <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_cond;
     t16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue;
     t16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_return_output := t16_MUX_uxn_opcodes_h_l996_c7_c789_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_5e56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1009_c7_c353] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_cond;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output := tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_c353] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1016_c21_ab52] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_ab52_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_3b4b_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_c353] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_5e56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_ab52_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l996_c7_c789_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;
     -- n16_MUX[uxn_opcodes_h_l1001_c7_b9a4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond;
     n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue;
     n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output := n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_c789] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output;

     -- t16_MUX[uxn_opcodes_h_l993_c7_f9b8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond;
     t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue;
     t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output := t16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_5e56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1005_c7_5e56] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_cond;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output := tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_5e56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_b9a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1009_c7_c353] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_return_output := result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_b9a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_c353_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse := VAR_t16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_f9b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_b9a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1005_c7_5e56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output := result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1001_c7_b9a4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output := tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;

     -- n16_MUX[uxn_opcodes_h_l996_c7_c789] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l996_c7_c789_cond <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_cond;
     n16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue;
     n16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_return_output := n16_MUX_uxn_opcodes_h_l996_c7_c789_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_c789] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output;

     -- t16_MUX[uxn_opcodes_h_l988_c2_9705] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l988_c2_9705_cond <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_cond;
     t16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue;
     t16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_return_output := t16_MUX_uxn_opcodes_h_l988_c2_9705_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_b9a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_c789] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l996_c7_c789_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_c789_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_c789_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_5e56_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l988_c2_9705_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c2_9705] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_c789] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l996_c7_c789] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l996_c7_c789_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_cond;
     tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iftrue;
     tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_return_output := tmp16_MUX_uxn_opcodes_h_l996_c7_c789_return_output;

     -- n16_MUX[uxn_opcodes_h_l993_c7_f9b8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond;
     n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue;
     n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output := n16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_f9b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_b9a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_f9b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_c789] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse := VAR_n16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_c789_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_c789_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_b9a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_c789_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c2_9705] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l996_c7_c789] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_cond;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_return_output := result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_f9b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;

     -- n16_MUX[uxn_opcodes_h_l988_c2_9705] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l988_c2_9705_cond <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_cond;
     n16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue;
     n16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_return_output := n16_MUX_uxn_opcodes_h_l988_c2_9705_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c2_9705] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_f9b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l993_c7_f9b8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_cond;
     tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output := tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l988_c2_9705_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_c789_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c2_9705] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c2_9705] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l993_c7_f9b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l988_c2_9705] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l988_c2_9705_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_cond;
     tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iftrue;
     tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_return_output := tmp16_MUX_uxn_opcodes_h_l988_c2_9705_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_f9b8_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_9705_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l988_c2_9705] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_cond;
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_return_output := result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l984_l1028_DUPLICATE_8001 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l984_l1028_DUPLICATE_8001_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_9705_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_9705_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l984_l1028_DUPLICATE_8001_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l984_l1028_DUPLICATE_8001_return_output;
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
