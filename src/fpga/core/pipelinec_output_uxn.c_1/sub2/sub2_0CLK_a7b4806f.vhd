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
-- Submodules: 107
entity sub2_0CLK_a7b4806f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_a7b4806f;
architecture arch of sub2_0CLK_a7b4806f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2658_c6_6bd3]
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2658_c1_a4a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2658_c2_9e74]
signal t16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2658_c2_9e74]
signal tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c2_9e74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c2_9e74]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c2_9e74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c2_9e74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2658_c2_9e74]
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c2_9e74]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2658_c2_9e74]
signal n16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2659_c3_284f[uxn_opcodes_h_l2659_c3_284f]
signal printf_uxn_opcodes_h_l2659_c3_284f_uxn_opcodes_h_l2659_c3_284f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2663_c11_acba]
signal BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2663_c7_5a78]
signal t16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2663_c7_5a78]
signal tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2663_c7_5a78]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2663_c7_5a78]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2663_c7_5a78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2663_c7_5a78]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2663_c7_5a78]
signal result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2663_c7_5a78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2663_c7_5a78]
signal n16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2666_c11_77ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2666_c7_3c55]
signal t16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2666_c7_3c55]
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2666_c7_3c55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2666_c7_3c55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2666_c7_3c55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2666_c7_3c55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2666_c7_3c55]
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2666_c7_3c55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2666_c7_3c55]
signal n16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2671_c11_b065]
signal BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2671_c7_fcea]
signal t16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2671_c7_fcea]
signal tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2671_c7_fcea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2671_c7_fcea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2671_c7_fcea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2671_c7_fcea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2671_c7_fcea]
signal result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2671_c7_fcea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2671_c7_fcea]
signal n16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2674_c11_d824]
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2674_c7_1d3b]
signal t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2674_c7_1d3b]
signal tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2674_c7_1d3b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2674_c7_1d3b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2674_c7_1d3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2674_c7_1d3b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2674_c7_1d3b]
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2674_c7_1d3b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2674_c7_1d3b]
signal n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2675_c3_8797]
signal BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_fed6]
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2678_c7_84d7]
signal tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2678_c7_84d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2678_c7_84d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2678_c7_84d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2678_c7_84d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2678_c7_84d7]
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2678_c7_84d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2678_c7_84d7]
signal n16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2681_c11_40dc]
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2681_c7_a6e7]
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2681_c7_a6e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2681_c7_a6e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2681_c7_a6e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2681_c7_a6e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2681_c7_a6e7]
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2681_c7_a6e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2681_c7_a6e7]
signal n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2686_c11_fe8b]
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2686_c7_04c8]
signal tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c7_04c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2686_c7_04c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c7_04c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c7_04c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2686_c7_04c8]
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c7_04c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2686_c7_04c8]
signal n16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2689_c11_96fb]
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2689_c7_5748]
signal tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2689_c7_5748]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2689_c7_5748]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2689_c7_5748]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2689_c7_5748]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2689_c7_5748]
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2689_c7_5748]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2689_c7_5748]
signal n16_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2690_c3_0e1e]
signal BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2691_c11_833a]
signal BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2693_c30_5637]
signal sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_8b88]
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_07a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2698_c7_07a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_07a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_07a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_07a1]
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2701_c31_24a2]
signal CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2703_c11_f2e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2703_c7_59d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2703_c7_59d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3
BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_left,
BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_right,
BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_return_output);

-- t16_MUX_uxn_opcodes_h_l2658_c2_9e74
t16_MUX_uxn_opcodes_h_l2658_c2_9e74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond,
t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue,
t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse,
t16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74
tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond,
tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue,
tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse,
tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74
result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_cond,
result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output);

-- n16_MUX_uxn_opcodes_h_l2658_c2_9e74
n16_MUX_uxn_opcodes_h_l2658_c2_9e74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond,
n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue,
n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse,
n16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output);

-- printf_uxn_opcodes_h_l2659_c3_284f_uxn_opcodes_h_l2659_c3_284f
printf_uxn_opcodes_h_l2659_c3_284f_uxn_opcodes_h_l2659_c3_284f : entity work.printf_uxn_opcodes_h_l2659_c3_284f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2659_c3_284f_uxn_opcodes_h_l2659_c3_284f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba
BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_left,
BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_right,
BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output);

-- t16_MUX_uxn_opcodes_h_l2663_c7_5a78
t16_MUX_uxn_opcodes_h_l2663_c7_5a78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond,
t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue,
t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse,
t16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78
tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond,
tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue,
tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse,
tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78
result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78
result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78
result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78
result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_cond,
result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78
result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output);

-- n16_MUX_uxn_opcodes_h_l2663_c7_5a78
n16_MUX_uxn_opcodes_h_l2663_c7_5a78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond,
n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue,
n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse,
n16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output);

-- t16_MUX_uxn_opcodes_h_l2666_c7_3c55
t16_MUX_uxn_opcodes_h_l2666_c7_3c55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond,
t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue,
t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse,
t16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55
tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond,
tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue,
tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse,
tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_cond,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output);

-- n16_MUX_uxn_opcodes_h_l2666_c7_3c55
n16_MUX_uxn_opcodes_h_l2666_c7_3c55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond,
n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue,
n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse,
n16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065
BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_left,
BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_right,
BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output);

-- t16_MUX_uxn_opcodes_h_l2671_c7_fcea
t16_MUX_uxn_opcodes_h_l2671_c7_fcea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond,
t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue,
t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse,
t16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea
tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond,
tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue,
tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse,
tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea
result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea
result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_cond,
result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output);

-- n16_MUX_uxn_opcodes_h_l2671_c7_fcea
n16_MUX_uxn_opcodes_h_l2671_c7_fcea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond,
n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue,
n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse,
n16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_left,
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_right,
BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output);

-- t16_MUX_uxn_opcodes_h_l2674_c7_1d3b
t16_MUX_uxn_opcodes_h_l2674_c7_1d3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond,
t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue,
t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse,
t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b
tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond,
tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b
result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output);

-- n16_MUX_uxn_opcodes_h_l2674_c7_1d3b
n16_MUX_uxn_opcodes_h_l2674_c7_1d3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond,
n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue,
n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse,
n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797
BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_left,
BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_right,
BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_left,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_right,
BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7
tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond,
tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7
result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output);

-- n16_MUX_uxn_opcodes_h_l2678_c7_84d7
n16_MUX_uxn_opcodes_h_l2678_c7_84d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond,
n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue,
n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse,
n16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_left,
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_right,
BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7
tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond,
tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output);

-- n16_MUX_uxn_opcodes_h_l2681_c7_a6e7
n16_MUX_uxn_opcodes_h_l2681_c7_a6e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond,
n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue,
n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse,
n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_left,
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_right,
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8
tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond,
tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8
result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output);

-- n16_MUX_uxn_opcodes_h_l2686_c7_04c8
n16_MUX_uxn_opcodes_h_l2686_c7_04c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond,
n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue,
n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse,
n16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_left,
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_right,
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2689_c7_5748
tmp16_MUX_uxn_opcodes_h_l2689_c7_5748 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_cond,
tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue,
tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse,
tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748
result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_cond,
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748
result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output);

-- n16_MUX_uxn_opcodes_h_l2689_c7_5748
n16_MUX_uxn_opcodes_h_l2689_c7_5748 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2689_c7_5748_cond,
n16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue,
n16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse,
n16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e
BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_left,
BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_right,
BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a
BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_left,
BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_right,
BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2693_c30_5637
sp_relative_shift_uxn_opcodes_h_l2693_c30_5637 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_ins,
sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_x,
sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_y,
sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_left,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_right,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1
result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2
CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_x,
CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3
result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f
CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_return_output,
 t16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
 tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
 n16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output,
 t16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output,
 tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output,
 n16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output,
 t16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output,
 tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output,
 n16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output,
 t16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output,
 tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output,
 n16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output,
 t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output,
 n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output,
 n16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output,
 n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output,
 n16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output,
 n16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output,
 CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2660_c3_51ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2659_c3_284f_uxn_opcodes_h_l2659_c3_284f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2664_c3_be0c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_2d86 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2672_c3_c31c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2676_c3_2cb8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_5ca1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2684_c3_dcc3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2687_c3_c994 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_ac5a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2696_c21_0580_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_9071 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2698_c7_07a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2701_c21_d986_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2667_l2682_l2675_l2690_DUPLICATE_e591_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2708_l2654_DUPLICATE_95de_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_2d86 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_2d86;
     VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2672_c3_c31c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2672_c3_c31c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_5ca1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2679_c3_5ca1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2676_c3_2cb8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2676_c3_2cb8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2684_c3_dcc3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2684_c3_dcc3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2660_c3_51ae := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2660_c3_51ae;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_ac5a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_ac5a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2664_c3_be0c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2664_c3_be0c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2687_c3_c994 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2687_c3_c994;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_9071 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_9071;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2666_c11_77ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2663_c11_acba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2698_c7_07a1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2698_c7_07a1_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2701_c31_24a2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_return_output := CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2674_c11_d824] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_left;
     BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output := BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2671_c11_b065] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_left;
     BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output := BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_8b88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_left;
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_return_output := BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2667_l2682_l2675_l2690_DUPLICATE_e591 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2667_l2682_l2675_l2690_DUPLICATE_e591_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2678_c11_fed6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2693_c30_5637] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_ins;
     sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_x;
     sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_return_output := sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2703_c11_f2e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2681_c11_40dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2689_c11_96fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2658_c6_6bd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2686_c11_fe8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2658_c6_6bd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2663_c11_acba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2666_c11_77ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_b065_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2674_c11_d824_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2678_c11_fed6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c11_40dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_fe8b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_96fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_8b88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_f2e0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2667_l2682_l2675_l2690_DUPLICATE_e591_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2667_l2682_l2675_l2690_DUPLICATE_e591_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2667_l2682_l2675_l2690_DUPLICATE_e591_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2666_l2689_l2663_l2686_l2658_l2681_DUPLICATE_7966_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2689_l2663_l2686_l2681_DUPLICATE_eac8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_c776_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2678_l2674_l2703_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_d36a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2678_l2674_l2671_l2698_l2666_l2663_l2686_l2658_l2681_DUPLICATE_e4a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2698_c7_07a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2693_c30_5637_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2698_c7_07a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_07a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2658_c1_a4a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2675_c3_8797] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_left;
     BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_return_output := BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2703_c7_59d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2689_c7_5748] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2701_c21_d986] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2701_c21_d986_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2701_c31_24a2_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2703_c7_59d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2690_c3_0e1e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_left;
     BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_return_output := BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2675_c3_8797_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2690_c3_0e1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2701_c21_d986_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2683_l2668_DUPLICATE_283f_return_output;
     VAR_printf_uxn_opcodes_h_l2659_c3_284f_uxn_opcodes_h_l2659_c3_284f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2658_c1_a4a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c7_59d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output;
     -- t16_MUX[uxn_opcodes_h_l2674_c7_1d3b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond;
     t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue;
     t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output := t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2691_c11_833a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2689_c7_5748] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c7_04c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2689_c7_5748] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_07a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2689_c7_5748] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2689_c7_5748_cond <= VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_cond;
     n16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue;
     n16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output := n16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_07a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output;

     -- printf_uxn_opcodes_h_l2659_c3_284f[uxn_opcodes_h_l2659_c3_284f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2659_c3_284f_uxn_opcodes_h_l2659_c3_284f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2659_c3_284f_uxn_opcodes_h_l2659_c3_284f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_07a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_07a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2689_c7_5748] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;

     -- n16_MUX[uxn_opcodes_h_l2686_c7_04c8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond;
     n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue;
     n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output := n16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2681_c7_a6e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c7_04c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2689_c7_5748] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_cond;
     tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output := tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2689_c7_5748] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2686_c7_04c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2671_c7_fcea] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond <= VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond;
     t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue;
     t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output := t16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2696_c21_0580] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2696_c21_0580_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2691_c11_833a_return_output);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2696_c21_0580_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c7_04c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2686_c7_04c8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_cond;
     tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output := tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c7_04c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2678_c7_84d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2681_c7_a6e7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond;
     n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue;
     n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output := n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2689_c7_5748] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_return_output := result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;

     -- t16_MUX[uxn_opcodes_h_l2666_c7_3c55] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond <= VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond;
     t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue;
     t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output := t16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2681_c7_a6e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2681_c7_a6e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_5748_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2681_c7_a6e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2681_c7_a6e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2678_c7_84d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2663_c7_5a78] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond <= VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond;
     t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue;
     t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output := t16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2686_c7_04c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2674_c7_1d3b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2678_c7_84d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2678_c7_84d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond;
     n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue;
     n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output := n16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2681_c7_a6e7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond;
     tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output := tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c7_04c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2671_c7_fcea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2674_c7_1d3b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2674_c7_1d3b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2678_c7_84d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2674_c7_1d3b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond;
     n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue;
     n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output := n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2681_c7_a6e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2678_c7_84d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2678_c7_84d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_cond;
     tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output := tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2658_c2_9e74] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond <= VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond;
     t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue;
     t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output := t16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2681_c7_a6e7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2674_c7_1d3b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2666_c7_3c55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;

     -- n16_MUX[uxn_opcodes_h_l2671_c7_fcea] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond <= VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond;
     n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue;
     n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output := n16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2671_c7_fcea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2678_c7_84d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2671_c7_fcea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2674_c7_1d3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2674_c7_1d3b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond;
     tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output := tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2678_c7_84d7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2666_c7_3c55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2663_c7_5a78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2671_c7_fcea] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_cond;
     tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output := tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2674_c7_1d3b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2671_c7_fcea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;

     -- n16_MUX[uxn_opcodes_h_l2666_c7_3c55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond <= VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond;
     n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue;
     n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output := n16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2671_c7_fcea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2666_c7_3c55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2674_c7_1d3b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2666_c7_3c55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2663_c7_5a78] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2671_c7_fcea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output := result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2663_c7_5a78] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2666_c7_3c55] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_cond;
     tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output := tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2658_c2_9e74] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;

     -- n16_MUX[uxn_opcodes_h_l2663_c7_5a78] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond <= VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond;
     n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue;
     n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output := n16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2666_c7_3c55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2671_c7_fcea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2666_c7_3c55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output := result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2663_c7_5a78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2663_c7_5a78] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_cond;
     tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output := tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2658_c2_9e74] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;

     -- n16_MUX[uxn_opcodes_h_l2658_c2_9e74] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond <= VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond;
     n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue;
     n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output := n16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2663_c7_5a78] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2658_c2_9e74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2666_c7_3c55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2658_c2_9e74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2658_c2_9e74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2663_c7_5a78] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output := result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2658_c2_9e74] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_cond;
     tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output := tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2663_c7_5a78_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2658_c2_9e74] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output := result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2708_l2654_DUPLICATE_95de LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2708_l2654_DUPLICATE_95de_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2658_c2_9e74_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2708_l2654_DUPLICATE_95de_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2708_l2654_DUPLICATE_95de_return_output;
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
