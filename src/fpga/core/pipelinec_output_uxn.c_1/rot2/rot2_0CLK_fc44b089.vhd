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
-- Submodules: 165
entity rot2_0CLK_fc44b089 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_fc44b089;
architecture arch of rot2_0CLK_fc44b089 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2866_c6_b9fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c1_8640]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2866_c2_3b19]
signal n16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2866_c2_3b19]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c2_3b19]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c2_3b19]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c2_3b19]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c2_3b19]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2866_c2_3b19]
signal result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2866_c2_3b19]
signal l16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2866_c2_3b19]
signal t16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2867_c3_ae85[uxn_opcodes_h_l2867_c3_ae85]
signal printf_uxn_opcodes_h_l2867_c3_ae85_uxn_opcodes_h_l2867_c3_ae85_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_c90c]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2871_c7_b827]
signal n16_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2871_c7_b827]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c7_b827]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2871_c7_b827]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c7_b827]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c7_b827]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2871_c7_b827]
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2871_c7_b827]
signal l16_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2871_c7_b827]
signal t16_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_5fd8]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2874_c7_7d8d]
signal n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2874_c7_7d8d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2874_c7_7d8d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2874_c7_7d8d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2874_c7_7d8d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2874_c7_7d8d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2874_c7_7d8d]
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2874_c7_7d8d]
signal l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2874_c7_7d8d]
signal t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_e420]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2879_c7_8c21]
signal n16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2879_c7_8c21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2879_c7_8c21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2879_c7_8c21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2879_c7_8c21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2879_c7_8c21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2879_c7_8c21]
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2879_c7_8c21]
signal l16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2879_c7_8c21]
signal t16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_e169]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2882_c7_3392]
signal n16_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2882_c7_3392]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2882_c7_3392]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2882_c7_3392]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2882_c7_3392]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2882_c7_3392]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2882_c7_3392]
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2882_c7_3392]
signal l16_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2882_c7_3392]
signal t16_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2883_c3_311a]
signal BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_3891]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2886_c7_1b79]
signal n16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2886_c7_1b79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2886_c7_1b79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2886_c7_1b79]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2886_c7_1b79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2886_c7_1b79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2886_c7_1b79]
signal result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2886_c7_1b79]
signal l16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_cff9]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2889_c7_c277]
signal n16_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2889_c7_c277]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2889_c7_c277]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2889_c7_c277]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2889_c7_c277]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2889_c7_c277]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2889_c7_c277]
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2889_c7_c277]
signal l16_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_2d1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2894_c7_dd96]
signal n16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2894_c7_dd96]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2894_c7_dd96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2894_c7_dd96]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2894_c7_dd96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2894_c7_dd96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2894_c7_dd96]
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2894_c7_dd96]
signal l16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_ec03]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2897_c7_480b]
signal n16_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2897_c7_480b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2897_c7_480b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2897_c7_480b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2897_c7_480b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2897_c7_480b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2897_c7_480b]
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2897_c7_480b]
signal l16_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2898_c3_2eaf]
signal BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_f28a]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2901_c7_67e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2901_c7_67e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2901_c7_67e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2901_c7_67e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2901_c7_67e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2901_c7_67e2]
signal result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2901_c7_67e2]
signal l16_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_730e]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2904_c7_a844]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2904_c7_a844]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2904_c7_a844]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2904_c7_a844]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2904_c7_a844]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2904_c7_a844]
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2904_c7_a844]
signal l16_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_ebba]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2909_c7_795b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2909_c7_795b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2909_c7_795b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2909_c7_795b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2909_c7_795b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2909_c7_795b]
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2909_c7_795b]
signal l16_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_3275]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2912_c7_819e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2912_c7_819e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2912_c7_819e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2912_c7_819e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2912_c7_819e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2912_c7_819e]
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2912_c7_819e]
signal l16_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2913_c3_2ff5]
signal BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2915_c30_9566]
signal sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_2938]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2920_c7_9bf8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2920_c7_9bf8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2920_c7_9bf8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2920_c7_9bf8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2920_c7_9bf8]
signal result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2923_c31_72d2]
signal CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_1fe1]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2925_c7_9f5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2925_c7_9f5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2925_c7_9f5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2925_c7_9f5b]
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_f436]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2929_c7_8988]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2929_c7_8988]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2929_c7_8988]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2929_c7_8988]
signal result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2931_c31_c653]
signal CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_a5a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2933_c7_138c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2933_c7_138c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2933_c7_138c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2933_c7_138c]
signal result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_1cf1]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2937_c7_6297]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2937_c7_6297]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2937_c7_6297]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2937_c7_6297]
signal result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2939_c31_a395]
signal CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_3c09]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2941_c7_b4c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2941_c7_b4c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa
BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_return_output);

-- n16_MUX_uxn_opcodes_h_l2866_c2_3b19
n16_MUX_uxn_opcodes_h_l2866_c2_3b19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond,
n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue,
n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse,
n16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19
result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_cond,
result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output);

-- l16_MUX_uxn_opcodes_h_l2866_c2_3b19
l16_MUX_uxn_opcodes_h_l2866_c2_3b19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond,
l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue,
l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse,
l16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output);

-- t16_MUX_uxn_opcodes_h_l2866_c2_3b19
t16_MUX_uxn_opcodes_h_l2866_c2_3b19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond,
t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue,
t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse,
t16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output);

-- printf_uxn_opcodes_h_l2867_c3_ae85_uxn_opcodes_h_l2867_c3_ae85
printf_uxn_opcodes_h_l2867_c3_ae85_uxn_opcodes_h_l2867_c3_ae85 : entity work.printf_uxn_opcodes_h_l2867_c3_ae85_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2867_c3_ae85_uxn_opcodes_h_l2867_c3_ae85_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output);

-- n16_MUX_uxn_opcodes_h_l2871_c7_b827
n16_MUX_uxn_opcodes_h_l2871_c7_b827 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2871_c7_b827_cond,
n16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue,
n16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse,
n16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827
result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_cond,
result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_return_output);

-- l16_MUX_uxn_opcodes_h_l2871_c7_b827
l16_MUX_uxn_opcodes_h_l2871_c7_b827 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2871_c7_b827_cond,
l16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue,
l16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse,
l16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output);

-- t16_MUX_uxn_opcodes_h_l2871_c7_b827
t16_MUX_uxn_opcodes_h_l2871_c7_b827 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2871_c7_b827_cond,
t16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue,
t16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse,
t16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output);

-- n16_MUX_uxn_opcodes_h_l2874_c7_7d8d
n16_MUX_uxn_opcodes_h_l2874_c7_7d8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond,
n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue,
n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse,
n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output);

-- l16_MUX_uxn_opcodes_h_l2874_c7_7d8d
l16_MUX_uxn_opcodes_h_l2874_c7_7d8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond,
l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue,
l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse,
l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output);

-- t16_MUX_uxn_opcodes_h_l2874_c7_7d8d
t16_MUX_uxn_opcodes_h_l2874_c7_7d8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond,
t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue,
t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse,
t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output);

-- n16_MUX_uxn_opcodes_h_l2879_c7_8c21
n16_MUX_uxn_opcodes_h_l2879_c7_8c21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond,
n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue,
n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse,
n16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_cond,
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output);

-- l16_MUX_uxn_opcodes_h_l2879_c7_8c21
l16_MUX_uxn_opcodes_h_l2879_c7_8c21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond,
l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue,
l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse,
l16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output);

-- t16_MUX_uxn_opcodes_h_l2879_c7_8c21
t16_MUX_uxn_opcodes_h_l2879_c7_8c21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond,
t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue,
t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse,
t16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output);

-- n16_MUX_uxn_opcodes_h_l2882_c7_3392
n16_MUX_uxn_opcodes_h_l2882_c7_3392 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2882_c7_3392_cond,
n16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue,
n16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse,
n16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_cond,
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_return_output);

-- l16_MUX_uxn_opcodes_h_l2882_c7_3392
l16_MUX_uxn_opcodes_h_l2882_c7_3392 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2882_c7_3392_cond,
l16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue,
l16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse,
l16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output);

-- t16_MUX_uxn_opcodes_h_l2882_c7_3392
t16_MUX_uxn_opcodes_h_l2882_c7_3392 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2882_c7_3392_cond,
t16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue,
t16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse,
t16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a
BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_left,
BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_right,
BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output);

-- n16_MUX_uxn_opcodes_h_l2886_c7_1b79
n16_MUX_uxn_opcodes_h_l2886_c7_1b79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond,
n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue,
n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse,
n16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79
result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_cond,
result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output);

-- l16_MUX_uxn_opcodes_h_l2886_c7_1b79
l16_MUX_uxn_opcodes_h_l2886_c7_1b79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond,
l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue,
l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse,
l16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output);

-- n16_MUX_uxn_opcodes_h_l2889_c7_c277
n16_MUX_uxn_opcodes_h_l2889_c7_c277 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2889_c7_c277_cond,
n16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue,
n16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse,
n16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_cond,
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_return_output);

-- l16_MUX_uxn_opcodes_h_l2889_c7_c277
l16_MUX_uxn_opcodes_h_l2889_c7_c277 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2889_c7_c277_cond,
l16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue,
l16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse,
l16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output);

-- n16_MUX_uxn_opcodes_h_l2894_c7_dd96
n16_MUX_uxn_opcodes_h_l2894_c7_dd96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond,
n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue,
n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse,
n16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_cond,
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output);

-- l16_MUX_uxn_opcodes_h_l2894_c7_dd96
l16_MUX_uxn_opcodes_h_l2894_c7_dd96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond,
l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue,
l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse,
l16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output);

-- n16_MUX_uxn_opcodes_h_l2897_c7_480b
n16_MUX_uxn_opcodes_h_l2897_c7_480b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2897_c7_480b_cond,
n16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue,
n16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse,
n16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_return_output);

-- l16_MUX_uxn_opcodes_h_l2897_c7_480b
l16_MUX_uxn_opcodes_h_l2897_c7_480b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2897_c7_480b_cond,
l16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue,
l16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse,
l16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf
BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_left,
BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_right,
BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2
result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2
result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2
result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2
result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output);

-- l16_MUX_uxn_opcodes_h_l2901_c7_67e2
l16_MUX_uxn_opcodes_h_l2901_c7_67e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2901_c7_67e2_cond,
l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue,
l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse,
l16_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_cond,
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_return_output);

-- l16_MUX_uxn_opcodes_h_l2904_c7_a844
l16_MUX_uxn_opcodes_h_l2904_c7_a844 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2904_c7_a844_cond,
l16_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue,
l16_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse,
l16_MUX_uxn_opcodes_h_l2904_c7_a844_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_return_output);

-- l16_MUX_uxn_opcodes_h_l2909_c7_795b
l16_MUX_uxn_opcodes_h_l2909_c7_795b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2909_c7_795b_cond,
l16_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue,
l16_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse,
l16_MUX_uxn_opcodes_h_l2909_c7_795b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_return_output);

-- l16_MUX_uxn_opcodes_h_l2912_c7_819e
l16_MUX_uxn_opcodes_h_l2912_c7_819e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2912_c7_819e_cond,
l16_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue,
l16_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse,
l16_MUX_uxn_opcodes_h_l2912_c7_819e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5
BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_left,
BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_right,
BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2915_c30_9566
sp_relative_shift_uxn_opcodes_h_l2915_c30_9566 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_ins,
sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_x,
sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_y,
sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8
result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8
result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2
CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_x,
CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988
result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_cond,
result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2931_c31_c653
CONST_SR_8_uxn_opcodes_h_l2931_c31_c653 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_x,
CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c
result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c
result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c
result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297
result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_cond,
result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2939_c31_a395
CONST_SR_8_uxn_opcodes_h_l2939_c31_a395 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_x,
CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6
result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6
result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a
CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_return_output,
 n16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
 l16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
 t16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output,
 n16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_return_output,
 l16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output,
 t16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output,
 n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output,
 l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output,
 t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output,
 n16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output,
 l16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output,
 t16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output,
 n16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_return_output,
 l16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output,
 t16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output,
 n16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output,
 l16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output,
 n16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_return_output,
 l16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output,
 n16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output,
 l16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output,
 n16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_return_output,
 l16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output,
 l16_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_return_output,
 l16_MUX_uxn_opcodes_h_l2904_c7_a844_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_return_output,
 l16_MUX_uxn_opcodes_h_l2909_c7_795b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_return_output,
 l16_MUX_uxn_opcodes_h_l2912_c7_819e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_return_output,
 sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_return_output,
 CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_return_output,
 CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_01f9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2867_c3_ae85_uxn_opcodes_h_l2867_c3_ae85_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_eb61 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2877_c3_4f43 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2880_c3_afc6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2884_c3_2082 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_5e9a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2892_c3_5306 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2895_c3_c4b8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2899_c3_4062 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2902_c3_768b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_c58a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2910_c3_d906 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_8262 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2918_c21_a923_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2922_c3_c11b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2923_c21_83e1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2926_c3_fca9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2927_c21_f9f7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2930_c3_5323 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2931_c21_519b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2934_c3_8466 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2935_c21_2bd5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2938_c3_ae5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2937_c7_6297_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2939_c21_1c7c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2905_l2883_l2898_l2875_l2890_l2913_DUPLICATE_cb03_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2946_l2862_DUPLICATE_2c53_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2902_c3_768b := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2902_c3_768b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_5e9a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_5e9a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2884_c3_2082 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2884_c3_2082;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_c58a := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_c58a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2910_c3_d906 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2910_c3_d906;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_right := to_unsigned(14, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_01f9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_01f9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2938_c3_ae5b := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2938_c3_ae5b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_right := to_unsigned(17, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2880_c3_afc6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2880_c3_afc6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_right := to_unsigned(16, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2926_c3_fca9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2926_c3_fca9;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_8262 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_8262;
     VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2922_c3_c11b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2922_c3_c11b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2895_c3_c4b8 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2895_c3_c4b8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2877_c3_4f43 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2877_c3_4f43;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2930_c3_5323 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2930_c3_5323;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2934_c3_8466 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2934_c3_8466;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2899_c3_4062 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2899_c3_4062;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2892_c3_5306 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2892_c3_5306;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_eb61 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_eb61;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_right := to_unsigned(18, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2905_l2883_l2898_l2875_l2890_l2913_DUPLICATE_cb03 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2905_l2883_l2898_l2875_l2890_l2913_DUPLICATE_cb03_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_cff9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_2938] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2939_c31_a395] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_return_output := CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_1fe1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_5fd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_c90c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_a5a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2923_c31_72d2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_return_output := CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2935_c21_2bd5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2935_c21_2bd5_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_1cf1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_3891] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_2d1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_ebba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2931_c31_c653] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_return_output := CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2915_c30_9566] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_ins;
     sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_x;
     sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_return_output := sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_730e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_3c09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_e420] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2937_c7_6297] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2937_c7_6297_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_ec03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2866_c6_b9fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_f436] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_f28a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_e169] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_3275] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2927_c21_f9f7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2927_c21_f9f7_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_b9fa_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c90c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_5fd8_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_e420_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_e169_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_3891_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_cff9_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_2d1f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_ec03_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_f28a_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_730e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_ebba_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_3275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_2938_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1fe1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_f436_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_a5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_1cf1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_3c09_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2905_l2883_l2898_l2875_l2890_l2913_DUPLICATE_cb03_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2905_l2883_l2898_l2875_l2890_l2913_DUPLICATE_cb03_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2905_l2883_l2898_l2875_l2890_l2913_DUPLICATE_cb03_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2905_l2883_l2898_l2875_l2890_l2913_DUPLICATE_cb03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2927_c21_f9f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2935_c21_2bd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_ae84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_151c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_0b89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_l2879_l2901_l2929_l2874_l2897_DUPLICATE_97a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_l2879_l2901_l2874_l2897_DUPLICATE_2797_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2937_c7_6297_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_9566_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2913_c3_2ff5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_left;
     BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_return_output := BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2912_c7_819e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2923_c21_83e1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2923_c21_83e1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_72d2_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c1_8640] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2931_c21_519b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2931_c21_519b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_c653_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2941_c7_b4c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2939_c21_1c7c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2939_c21_1c7c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_a395_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2937_c7_6297] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2941_c7_b4c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2883_c3_311a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_left;
     BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_return_output := BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2898_c3_2eaf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_left;
     BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_return_output := BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2920_c7_9bf8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_311a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_2eaf_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2923_c21_83e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2931_c21_519b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2939_c21_1c7c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2891_l2876_l2906_DUPLICATE_b09a_return_output;
     VAR_printf_uxn_opcodes_h_l2867_c3_ae85_uxn_opcodes_h_l2867_c3_ae85_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_8640_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_b4c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_6297_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2918_c21_a923] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2918_c21_a923_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_2ff5_return_output);

     -- l16_MUX[uxn_opcodes_h_l2912_c7_819e] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2912_c7_819e_cond <= VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_cond;
     l16_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue;
     l16_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_return_output := l16_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2937_c7_6297] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_return_output := result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2909_c7_795b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2897_c7_480b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2897_c7_480b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_cond;
     n16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue;
     n16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output := n16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2882_c7_3392] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2882_c7_3392_cond <= VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_cond;
     t16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue;
     t16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output := t16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2912_c7_819e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;

     -- printf_uxn_opcodes_h_l2867_c3_ae85[uxn_opcodes_h_l2867_c3_ae85] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2867_c3_ae85_uxn_opcodes_h_l2867_c3_ae85_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2867_c3_ae85_uxn_opcodes_h_l2867_c3_ae85_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2937_c7_6297] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2937_c7_6297] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2933_c7_138c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2918_c21_a923_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_6297_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_6297_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_138c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_6297_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2933_c7_138c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2879_c7_8c21] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond <= VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond;
     t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue;
     t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output := t16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2909_c7_795b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2904_c7_a844] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;

     -- l16_MUX[uxn_opcodes_h_l2909_c7_795b] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2909_c7_795b_cond <= VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_cond;
     l16_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue;
     l16_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_return_output := l16_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2929_c7_8988] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_return_output;

     -- n16_MUX[uxn_opcodes_h_l2894_c7_dd96] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond <= VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond;
     n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue;
     n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output := n16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2933_c7_138c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2933_c7_138c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_138c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_138c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_8988_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_138c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2929_c7_8988] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_return_output := result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_return_output;

     -- t16_MUX[uxn_opcodes_h_l2874_c7_7d8d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond;
     t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue;
     t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output := t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2929_c7_8988] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2901_c7_67e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2889_c7_c277] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2889_c7_c277_cond <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_cond;
     n16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue;
     n16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output := n16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2925_c7_9f5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output;

     -- l16_MUX[uxn_opcodes_h_l2904_c7_a844] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2904_c7_a844_cond <= VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_cond;
     l16_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue;
     l16_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_return_output := l16_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2904_c7_a844] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2929_c7_8988] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_8988_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_8988_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_8988_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2897_c7_480b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2925_c7_9f5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2925_c7_9f5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output;

     -- l16_MUX[uxn_opcodes_h_l2901_c7_67e2] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2901_c7_67e2_cond <= VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_cond;
     l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue;
     l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output := l16_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2920_c7_9bf8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2871_c7_b827] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2871_c7_b827_cond <= VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_cond;
     t16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue;
     t16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output := t16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2925_c7_9f5b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2901_c7_67e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2886_c7_1b79] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond <= VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond;
     n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue;
     n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output := n16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_9f5b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;
     -- l16_MUX[uxn_opcodes_h_l2897_c7_480b] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2897_c7_480b_cond <= VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_cond;
     l16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue;
     l16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output := l16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2866_c2_3b19] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond <= VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond;
     t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue;
     t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output := t16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2912_c7_819e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2920_c7_9bf8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2897_c7_480b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2920_c7_9bf8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2894_c7_dd96] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2920_c7_9bf8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2882_c7_3392] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2882_c7_3392_cond <= VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_cond;
     n16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue;
     n16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output := n16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_9bf8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2912_c7_819e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2912_c7_819e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2912_c7_819e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2879_c7_8c21] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond <= VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond;
     n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue;
     n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output := n16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2909_c7_795b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;

     -- l16_MUX[uxn_opcodes_h_l2894_c7_dd96] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond <= VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_cond;
     l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue;
     l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output := l16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2894_c7_dd96] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2889_c7_c277] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_819e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2909_c7_795b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2889_c7_c277] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2904_c7_a844] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2909_c7_795b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2909_c7_795b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;

     -- l16_MUX[uxn_opcodes_h_l2889_c7_c277] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2889_c7_c277_cond <= VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_cond;
     l16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue;
     l16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output := l16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2886_c7_1b79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;

     -- n16_MUX[uxn_opcodes_h_l2874_c7_7d8d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond;
     n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue;
     n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output := n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_795b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2904_c7_a844] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;

     -- n16_MUX[uxn_opcodes_h_l2871_c7_b827] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2871_c7_b827_cond <= VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_cond;
     n16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue;
     n16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output := n16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2886_c7_1b79] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;

     -- l16_MUX[uxn_opcodes_h_l2886_c7_1b79] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond <= VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_cond;
     l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue;
     l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output := l16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2904_c7_a844] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_return_output := result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2904_c7_a844] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2901_c7_67e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2882_c7_3392] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_a844_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2882_c7_3392] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;

     -- l16_MUX[uxn_opcodes_h_l2882_c7_3392] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2882_c7_3392_cond <= VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_cond;
     l16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue;
     l16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output := l16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2897_c7_480b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2879_c7_8c21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2901_c7_67e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2866_c2_3b19] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond <= VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond;
     n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue;
     n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output := n16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2901_c7_67e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2901_c7_67e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_67e2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2879_c7_8c21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2874_c7_7d8d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2894_c7_dd96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;

     -- l16_MUX[uxn_opcodes_h_l2879_c7_8c21] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond <= VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_cond;
     l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue;
     l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output := l16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2897_c7_480b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2897_c7_480b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2897_c7_480b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_480b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2894_c7_dd96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2894_c7_dd96] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output := result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2871_c7_b827] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;

     -- l16_MUX[uxn_opcodes_h_l2874_c7_7d8d] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond <= VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond;
     l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue;
     l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output := l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2874_c7_7d8d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2894_c7_dd96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2889_c7_c277] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_dd96_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2886_c7_1b79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2889_c7_c277] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2889_c7_c277] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_return_output := result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2871_c7_b827] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2889_c7_c277] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2866_c2_3b19] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;

     -- l16_MUX[uxn_opcodes_h_l2871_c7_b827] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2871_c7_b827_cond <= VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_cond;
     l16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue;
     l16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output := l16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_c277_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c2_3b19] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2886_c7_1b79] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output := result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;

     -- l16_MUX[uxn_opcodes_h_l2866_c2_3b19] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond <= VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_cond;
     l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue;
     l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output := l16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2886_c7_1b79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2882_c7_3392] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2886_c7_1b79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1b79_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2882_c7_3392] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2882_c7_3392] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2879_c7_8c21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2882_c7_3392] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_return_output := result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_3392_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2874_c7_7d8d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2879_c7_8c21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2879_c7_8c21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2879_c7_8c21] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output := result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_8c21_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2874_c7_7d8d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2874_c7_7d8d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2874_c7_7d8d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c7_b827] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_7d8d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2871_c7_b827] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_return_output := result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c7_b827] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c2_3b19] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c7_b827] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_b827_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c2_3b19] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c2_3b19] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2866_c2_3b19] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output := result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output;

     -- Submodule level 20
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2946_l2862_DUPLICATE_2c53 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2946_l2862_DUPLICATE_2c53_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_3b19_return_output);

     -- Submodule level 21
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2946_l2862_DUPLICATE_2c53_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2946_l2862_DUPLICATE_2c53_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
