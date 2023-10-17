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
-- BIN_OP_EQ[uxn_opcodes_h_l2866_c6_892d]
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c1_b6af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2866_c2_7c62]
signal n16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2866_c2_7c62]
signal l16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2866_c2_7c62]
signal result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c2_7c62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2866_c2_7c62]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c2_7c62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c2_7c62]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c2_7c62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2866_c2_7c62]
signal t16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2867_c3_1efd[uxn_opcodes_h_l2867_c3_1efd]
signal printf_uxn_opcodes_h_l2867_c3_1efd_uxn_opcodes_h_l2867_c3_1efd_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_1ec7]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2871_c7_9bec]
signal n16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2871_c7_9bec]
signal l16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2871_c7_9bec]
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c7_9bec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2871_c7_9bec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c7_9bec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2871_c7_9bec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c7_9bec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2871_c7_9bec]
signal t16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_48de]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2874_c7_5676]
signal n16_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2874_c7_5676]
signal l16_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2874_c7_5676]
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2874_c7_5676]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2874_c7_5676]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2874_c7_5676]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2874_c7_5676]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2874_c7_5676]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2874_c7_5676]
signal t16_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_c6f2]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2879_c7_1256]
signal n16_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2879_c7_1256]
signal l16_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2879_c7_1256]
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2879_c7_1256]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2879_c7_1256]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2879_c7_1256]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2879_c7_1256]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2879_c7_1256]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2879_c7_1256]
signal t16_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_688f]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2882_c7_907a]
signal n16_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2882_c7_907a]
signal l16_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2882_c7_907a]
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2882_c7_907a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2882_c7_907a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2882_c7_907a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2882_c7_907a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2882_c7_907a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2882_c7_907a]
signal t16_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2883_c3_09ca]
signal BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_6d5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2886_c7_1eee]
signal n16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2886_c7_1eee]
signal l16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2886_c7_1eee]
signal result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2886_c7_1eee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2886_c7_1eee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2886_c7_1eee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2886_c7_1eee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2886_c7_1eee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_3ace]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2889_c7_a11c]
signal n16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2889_c7_a11c]
signal l16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2889_c7_a11c]
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2889_c7_a11c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2889_c7_a11c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2889_c7_a11c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2889_c7_a11c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2889_c7_a11c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_f44e]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2894_c7_86cc]
signal n16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2894_c7_86cc]
signal l16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2894_c7_86cc]
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2894_c7_86cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2894_c7_86cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2894_c7_86cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2894_c7_86cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2894_c7_86cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_0950]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2897_c7_63e3]
signal n16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(15 downto 0);

-- l16_MUX[uxn_opcodes_h_l2897_c7_63e3]
signal l16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2897_c7_63e3]
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2897_c7_63e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2897_c7_63e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2897_c7_63e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2897_c7_63e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2897_c7_63e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2898_c3_bb52]
signal BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_70c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2901_c7_0a84]
signal l16_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2901_c7_0a84]
signal result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2901_c7_0a84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2901_c7_0a84]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2901_c7_0a84]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2901_c7_0a84]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2901_c7_0a84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_275a]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2904_c7_9f0a]
signal l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2904_c7_9f0a]
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2904_c7_9f0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2904_c7_9f0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2904_c7_9f0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2904_c7_9f0a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2904_c7_9f0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_0f0c]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2909_c7_102b]
signal l16_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2909_c7_102b]
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2909_c7_102b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2909_c7_102b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2909_c7_102b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2909_c7_102b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2909_c7_102b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_5053]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2912_c7_8c28]
signal l16_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2912_c7_8c28]
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2912_c7_8c28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2912_c7_8c28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2912_c7_8c28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2912_c7_8c28]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2912_c7_8c28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2913_c3_43ae]
signal BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2915_c30_efa5]
signal sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_3c43]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2920_c7_035c]
signal result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2920_c7_035c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2920_c7_035c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2920_c7_035c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2920_c7_035c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2923_c31_ed6e]
signal CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_724a]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2925_c7_a039]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2925_c7_a039]
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2925_c7_a039]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2925_c7_a039]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_b92b]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2929_c7_4869]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2929_c7_4869]
signal result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2929_c7_4869]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2929_c7_4869]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2931_c31_9ce9]
signal CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_5ba5]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2933_c7_2571]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2933_c7_2571]
signal result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2933_c7_2571]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2933_c7_2571]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_09e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2937_c7_0e56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2937_c7_0e56]
signal result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2937_c7_0e56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2937_c7_0e56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2939_c31_9dee]
signal CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_b51c]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2941_c7_fa9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2941_c7_fa9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_25e8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d
BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_left,
BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_right,
BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_return_output);

-- n16_MUX_uxn_opcodes_h_l2866_c2_7c62
n16_MUX_uxn_opcodes_h_l2866_c2_7c62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond,
n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue,
n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse,
n16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output);

-- l16_MUX_uxn_opcodes_h_l2866_c2_7c62
l16_MUX_uxn_opcodes_h_l2866_c2_7c62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond,
l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue,
l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse,
l16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62
result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_cond,
result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output);

-- t16_MUX_uxn_opcodes_h_l2866_c2_7c62
t16_MUX_uxn_opcodes_h_l2866_c2_7c62 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond,
t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue,
t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse,
t16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output);

-- printf_uxn_opcodes_h_l2867_c3_1efd_uxn_opcodes_h_l2867_c3_1efd
printf_uxn_opcodes_h_l2867_c3_1efd_uxn_opcodes_h_l2867_c3_1efd : entity work.printf_uxn_opcodes_h_l2867_c3_1efd_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2867_c3_1efd_uxn_opcodes_h_l2867_c3_1efd_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output);

-- n16_MUX_uxn_opcodes_h_l2871_c7_9bec
n16_MUX_uxn_opcodes_h_l2871_c7_9bec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond,
n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue,
n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse,
n16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output);

-- l16_MUX_uxn_opcodes_h_l2871_c7_9bec
l16_MUX_uxn_opcodes_h_l2871_c7_9bec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond,
l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue,
l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse,
l16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec
result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_cond,
result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output);

-- t16_MUX_uxn_opcodes_h_l2871_c7_9bec
t16_MUX_uxn_opcodes_h_l2871_c7_9bec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond,
t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue,
t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse,
t16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output);

-- n16_MUX_uxn_opcodes_h_l2874_c7_5676
n16_MUX_uxn_opcodes_h_l2874_c7_5676 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2874_c7_5676_cond,
n16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue,
n16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse,
n16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output);

-- l16_MUX_uxn_opcodes_h_l2874_c7_5676
l16_MUX_uxn_opcodes_h_l2874_c7_5676 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2874_c7_5676_cond,
l16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue,
l16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse,
l16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_cond,
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_return_output);

-- t16_MUX_uxn_opcodes_h_l2874_c7_5676
t16_MUX_uxn_opcodes_h_l2874_c7_5676 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2874_c7_5676_cond,
t16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue,
t16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse,
t16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output);

-- n16_MUX_uxn_opcodes_h_l2879_c7_1256
n16_MUX_uxn_opcodes_h_l2879_c7_1256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2879_c7_1256_cond,
n16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue,
n16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse,
n16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output);

-- l16_MUX_uxn_opcodes_h_l2879_c7_1256
l16_MUX_uxn_opcodes_h_l2879_c7_1256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2879_c7_1256_cond,
l16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue,
l16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse,
l16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_cond,
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_return_output);

-- t16_MUX_uxn_opcodes_h_l2879_c7_1256
t16_MUX_uxn_opcodes_h_l2879_c7_1256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2879_c7_1256_cond,
t16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue,
t16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse,
t16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output);

-- n16_MUX_uxn_opcodes_h_l2882_c7_907a
n16_MUX_uxn_opcodes_h_l2882_c7_907a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2882_c7_907a_cond,
n16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue,
n16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse,
n16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output);

-- l16_MUX_uxn_opcodes_h_l2882_c7_907a
l16_MUX_uxn_opcodes_h_l2882_c7_907a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2882_c7_907a_cond,
l16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue,
l16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse,
l16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_return_output);

-- t16_MUX_uxn_opcodes_h_l2882_c7_907a
t16_MUX_uxn_opcodes_h_l2882_c7_907a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2882_c7_907a_cond,
t16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue,
t16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse,
t16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca
BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_left,
BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_right,
BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output);

-- n16_MUX_uxn_opcodes_h_l2886_c7_1eee
n16_MUX_uxn_opcodes_h_l2886_c7_1eee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond,
n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue,
n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse,
n16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output);

-- l16_MUX_uxn_opcodes_h_l2886_c7_1eee
l16_MUX_uxn_opcodes_h_l2886_c7_1eee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond,
l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue,
l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse,
l16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee
result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_cond,
result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output);

-- n16_MUX_uxn_opcodes_h_l2889_c7_a11c
n16_MUX_uxn_opcodes_h_l2889_c7_a11c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond,
n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue,
n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse,
n16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output);

-- l16_MUX_uxn_opcodes_h_l2889_c7_a11c
l16_MUX_uxn_opcodes_h_l2889_c7_a11c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond,
l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue,
l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse,
l16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output);

-- n16_MUX_uxn_opcodes_h_l2894_c7_86cc
n16_MUX_uxn_opcodes_h_l2894_c7_86cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond,
n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue,
n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse,
n16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output);

-- l16_MUX_uxn_opcodes_h_l2894_c7_86cc
l16_MUX_uxn_opcodes_h_l2894_c7_86cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond,
l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue,
l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse,
l16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output);

-- n16_MUX_uxn_opcodes_h_l2897_c7_63e3
n16_MUX_uxn_opcodes_h_l2897_c7_63e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond,
n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue,
n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse,
n16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output);

-- l16_MUX_uxn_opcodes_h_l2897_c7_63e3
l16_MUX_uxn_opcodes_h_l2897_c7_63e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond,
l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue,
l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse,
l16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52
BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_left,
BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_right,
BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output);

-- l16_MUX_uxn_opcodes_h_l2901_c7_0a84
l16_MUX_uxn_opcodes_h_l2901_c7_0a84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2901_c7_0a84_cond,
l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue,
l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse,
l16_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84
result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_cond,
result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84
result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84
result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84
result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84
result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output);

-- l16_MUX_uxn_opcodes_h_l2904_c7_9f0a
l16_MUX_uxn_opcodes_h_l2904_c7_9f0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond,
l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue,
l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse,
l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output);

-- l16_MUX_uxn_opcodes_h_l2909_c7_102b
l16_MUX_uxn_opcodes_h_l2909_c7_102b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2909_c7_102b_cond,
l16_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue,
l16_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse,
l16_MUX_uxn_opcodes_h_l2909_c7_102b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output);

-- l16_MUX_uxn_opcodes_h_l2912_c7_8c28
l16_MUX_uxn_opcodes_h_l2912_c7_8c28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2912_c7_8c28_cond,
l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue,
l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse,
l16_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_cond,
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae
BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_left,
BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_right,
BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5
sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_ins,
sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_x,
sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_y,
sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c
result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c
result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e
CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_x,
CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_cond,
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869
result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_cond,
result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9
CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_x,
CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571
result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571
result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_cond,
result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571
result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56
result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_cond,
result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee
CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_x,
CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a
result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a
result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe
CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_return_output,
 n16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
 l16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
 t16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output,
 n16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output,
 l16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output,
 t16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output,
 n16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output,
 l16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_return_output,
 t16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output,
 n16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output,
 l16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_return_output,
 t16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output,
 n16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output,
 l16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_return_output,
 t16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output,
 n16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output,
 l16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output,
 n16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output,
 l16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output,
 n16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output,
 l16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output,
 n16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output,
 l16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output,
 l16_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output,
 l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output,
 l16_MUX_uxn_opcodes_h_l2909_c7_102b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output,
 l16_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_return_output,
 sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_return_output,
 CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_return_output,
 CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output,
 CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_f7ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2867_c3_1efd_uxn_opcodes_h_l2867_c3_1efd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_43d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2877_c3_5a9b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2880_c3_8cb4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2884_c3_099d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_ccfe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2892_c3_89bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2895_c3_6749 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2899_c3_2a2e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2902_c3_f7af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_9217 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2910_c3_43bf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_aea3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2918_c21_139d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2922_c3_fc96 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2923_c21_31c5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2926_c3_5bad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2927_c21_7541_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2930_c3_7b12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2931_c21_4db3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2934_c3_dc4d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2935_c21_7da2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2938_c3_f8ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2937_c7_0e56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2939_c21_0a59_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2875_l2905_l2898_l2883_l2890_l2913_DUPLICATE_5648_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2946_l2862_DUPLICATE_2248_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2899_c3_2a2e := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2899_c3_2a2e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2930_c3_7b12 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2930_c3_7b12;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2922_c3_fc96 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2922_c3_fc96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_right := to_unsigned(11, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2880_c3_8cb4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2880_c3_8cb4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2902_c3_f7af := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2902_c3_f7af;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2934_c3_dc4d := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2934_c3_dc4d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2877_c3_5a9b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2877_c3_5a9b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2884_c3_099d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2884_c3_099d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_right := to_unsigned(8, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_f7ba := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_f7ba;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2892_c3_89bc := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2892_c3_89bc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_ccfe := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2887_c3_ccfe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_aea3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_aea3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2895_c3_6749 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2895_c3_6749;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2938_c3_f8ae := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2938_c3_f8ae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2910_c3_43bf := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2910_c3_43bf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2926_c3_5bad := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2926_c3_5bad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_43d2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_43d2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_9217 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_9217;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse := t16;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2935_c21_7da2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2935_c21_7da2_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2937_c7_0e56] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2937_c7_0e56_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_c6f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2875_l2905_l2898_l2883_l2890_l2913_DUPLICATE_5648 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2875_l2905_l2898_l2883_l2890_l2913_DUPLICATE_5648_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l2915_c30_efa5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_ins;
     sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_x;
     sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_return_output := sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_688f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_48de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_0f0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_f44e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2927_c21_7541] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2927_c21_7541_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_1ec7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_3ace] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_3c43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_70c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_5ba5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2939_c31_9dee] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_return_output := CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_b92b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_6d5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_0950] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_275a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2931_c31_9ce9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_return_output := CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_b51c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2866_c6_892d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_09e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_724a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2923_c31_ed6e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_return_output := CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_5053] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c6_892d_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_1ec7_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_48de_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c6f2_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_688f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_6d5a_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_3ace_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f44e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_0950_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_70c0_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_275a_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_0f0c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_5053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3c43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_724a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_b92b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_5ba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_09e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_b51c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2875_l2905_l2898_l2883_l2890_l2913_DUPLICATE_5648_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2875_l2905_l2898_l2883_l2890_l2913_DUPLICATE_5648_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2875_l2905_l2898_l2883_l2890_l2913_DUPLICATE_5648_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2875_l2905_l2898_l2883_l2890_l2913_DUPLICATE_5648_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2927_c21_7541_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2935_c21_7da2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2912_l2886_l2909_l2882_l2904_DUPLICATE_54d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2889_l2912_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_d0e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2920_l2866_l2889_l2886_l2909_l2882_l2904_DUPLICATE_a63e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2879_l2901_l2929_l2874_l2897_l2925_l2871_l2894_l2920_l2866_l2889_l2941_l2886_l2909_l2937_l2882_l2904_l2933_DUPLICATE_360a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2879_l2901_l2874_l2897_l2871_l2894_l2866_l2889_l2886_l2909_l2937_l2882_l2904_DUPLICATE_731a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2937_c7_0e56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2915_c30_efa5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c1_b6af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2941_c7_fa9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2913_c3_43ae] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_left;
     BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_return_output := BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2898_c3_bb52] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_left;
     BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_return_output := BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2931_c21_4db3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2931_c21_4db3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2931_c31_9ce9_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2939_c21_0a59] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2939_c21_0a59_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2939_c31_9dee_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2923_c21_31c5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2923_c21_31c5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2923_c31_ed6e_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2941_c7_fa9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2937_c7_0e56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2920_c7_035c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2912_c7_8c28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2883_c3_09ca] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_left;
     BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_return_output := BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2883_c3_09ca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2898_c3_bb52_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2923_c21_31c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2931_c21_4db3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2939_c21_0a59_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2876_l2906_l2891_DUPLICATE_20fe_return_output;
     VAR_printf_uxn_opcodes_h_l2867_c3_1efd_uxn_opcodes_h_l2867_c3_1efd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_b6af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2920_c7_035c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2941_c7_fa9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output;
     -- l16_MUX[uxn_opcodes_h_l2912_c7_8c28] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2912_c7_8c28_cond <= VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_cond;
     l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue;
     l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output := l16_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2937_c7_0e56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2918_c21_139d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2918_c21_139d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2913_c3_43ae_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2933_c7_2571] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_return_output;

     -- n16_MUX[uxn_opcodes_h_l2897_c7_63e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond;
     n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue;
     n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output := n16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2937_c7_0e56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output := result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2937_c7_0e56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2909_c7_102b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2912_c7_8c28] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;

     -- t16_MUX[uxn_opcodes_h_l2882_c7_907a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2882_c7_907a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_cond;
     t16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue;
     t16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output := t16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;

     -- printf_uxn_opcodes_h_l2867_c3_1efd[uxn_opcodes_h_l2867_c3_1efd] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2867_c3_1efd_uxn_opcodes_h_l2867_c3_1efd_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2867_c3_1efd_uxn_opcodes_h_l2867_c3_1efd_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2918_c21_139d_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2933_c7_2571_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2937_c7_0e56_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2933_c7_2571] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_return_output;

     -- n16_MUX[uxn_opcodes_h_l2894_c7_86cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond;
     n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue;
     n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output := n16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;

     -- l16_MUX[uxn_opcodes_h_l2909_c7_102b] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2909_c7_102b_cond <= VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_cond;
     l16_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue;
     l16_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_return_output := l16_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2904_c7_9f0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2909_c7_102b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2933_c7_2571] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_return_output;

     -- t16_MUX[uxn_opcodes_h_l2879_c7_1256] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2879_c7_1256_cond <= VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_cond;
     t16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue;
     t16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output := t16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2929_c7_4869] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2933_c7_2571] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_return_output := result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2933_c7_2571_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2933_c7_2571_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_4869_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2933_c7_2571_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2901_c7_0a84] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;

     -- t16_MUX[uxn_opcodes_h_l2874_c7_5676] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2874_c7_5676_cond <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_cond;
     t16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue;
     t16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output := t16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;

     -- l16_MUX[uxn_opcodes_h_l2904_c7_9f0a] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond <= VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond;
     l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue;
     l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output := l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2929_c7_4869] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_return_output := result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2904_c7_9f0a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2929_c7_4869] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2925_c7_a039] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2929_c7_4869] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_return_output;

     -- n16_MUX[uxn_opcodes_h_l2889_c7_a11c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond;
     n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue;
     n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output := n16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_4869_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_4869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2925_c7_a039_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2929_c7_4869_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2901_c7_0a84] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2925_c7_a039] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_return_output;

     -- n16_MUX[uxn_opcodes_h_l2886_c7_1eee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond <= VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond;
     n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue;
     n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output := n16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2920_c7_035c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2925_c7_a039] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_return_output := result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_return_output;

     -- l16_MUX[uxn_opcodes_h_l2901_c7_0a84] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2901_c7_0a84_cond <= VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_cond;
     l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue;
     l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output := l16_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;

     -- t16_MUX[uxn_opcodes_h_l2871_c7_9bec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond <= VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond;
     t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue;
     t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output := t16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2925_c7_a039] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2897_c7_63e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2925_c7_a039_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2925_c7_a039_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_035c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2925_c7_a039_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2920_c7_035c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_return_output;

     -- l16_MUX[uxn_opcodes_h_l2897_c7_63e3] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond <= VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_cond;
     l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue;
     l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output := l16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2920_c7_035c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2897_c7_63e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2894_c7_86cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2866_c2_7c62] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond <= VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond;
     t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue;
     t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output := t16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;

     -- n16_MUX[uxn_opcodes_h_l2882_c7_907a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2882_c7_907a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_cond;
     n16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue;
     n16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output := n16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2920_c7_035c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2912_c7_8c28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_035c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_035c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2920_c7_035c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2894_c7_86cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2912_c7_8c28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2889_c7_a11c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2879_c7_1256] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2879_c7_1256_cond <= VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_cond;
     n16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue;
     n16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output := n16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2909_c7_102b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;

     -- l16_MUX[uxn_opcodes_h_l2894_c7_86cc] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond <= VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_cond;
     l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue;
     l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output := l16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2912_c7_8c28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2912_c7_8c28] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output := result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2912_c7_8c28_return_output;
     -- n16_MUX[uxn_opcodes_h_l2874_c7_5676] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2874_c7_5676_cond <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_cond;
     n16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue;
     n16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output := n16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2909_c7_102b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;

     -- l16_MUX[uxn_opcodes_h_l2889_c7_a11c] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond <= VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_cond;
     l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue;
     l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output := l16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2889_c7_a11c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2886_c7_1eee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2909_c7_102b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2904_c7_9f0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2909_c7_102b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2909_c7_102b_return_output;
     -- l16_MUX[uxn_opcodes_h_l2886_c7_1eee] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond <= VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_cond;
     l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue;
     l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output := l16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2882_c7_907a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2871_c7_9bec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond <= VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond;
     n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue;
     n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output := n16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2901_c7_0a84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2886_c7_1eee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2904_c7_9f0a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2904_c7_9f0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2904_c7_9f0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2904_c7_9f0a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2901_c7_0a84] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2879_c7_1256] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2882_c7_907a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2901_c7_0a84] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output := result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;

     -- l16_MUX[uxn_opcodes_h_l2882_c7_907a] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2882_c7_907a_cond <= VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_cond;
     l16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue;
     l16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output := l16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2866_c2_7c62] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond <= VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond;
     n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue;
     n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output := n16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2897_c7_63e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2901_c7_0a84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2901_c7_0a84_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2874_c7_5676] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;

     -- l16_MUX[uxn_opcodes_h_l2879_c7_1256] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2879_c7_1256_cond <= VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_cond;
     l16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue;
     l16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output := l16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2894_c7_86cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2897_c7_63e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2897_c7_63e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2879_c7_1256] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2897_c7_63e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2897_c7_63e3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2874_c7_5676] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2894_c7_86cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2871_c7_9bec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2889_c7_a11c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2894_c7_86cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;

     -- l16_MUX[uxn_opcodes_h_l2874_c7_5676] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2874_c7_5676_cond <= VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_cond;
     l16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue;
     l16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output := l16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2894_c7_86cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2894_c7_86cc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2889_c7_a11c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2886_c7_1eee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2871_c7_9bec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;

     -- l16_MUX[uxn_opcodes_h_l2871_c7_9bec] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond <= VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_cond;
     l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue;
     l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output := l16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2889_c7_a11c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2889_c7_a11c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2866_c2_7c62] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2889_c7_a11c_return_output;
     -- l16_MUX[uxn_opcodes_h_l2866_c2_7c62] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond <= VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_cond;
     l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue;
     l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output := l16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2886_c7_1eee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2886_c7_1eee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2882_c7_907a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2886_c7_1eee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output := result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c2_7c62] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2886_c7_1eee_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2882_c7_907a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2879_c7_1256] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2882_c7_907a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2882_c7_907a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2882_c7_907a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2879_c7_1256] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2879_c7_1256] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2874_c7_5676] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2879_c7_1256] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_return_output := result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2879_c7_1256_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2874_c7_5676] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2874_c7_5676] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c7_9bec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2874_c7_5676] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_return_output := result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2874_c7_5676_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2871_c7_9bec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output := result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c7_9bec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c7_9bec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c2_7c62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2871_c7_9bec_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2866_c2_7c62] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output := result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c2_7c62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c2_7c62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output;

     -- Submodule level 20
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2946_l2862_DUPLICATE_2248 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2946_l2862_DUPLICATE_2248_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c2_7c62_return_output);

     -- Submodule level 21
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2946_l2862_DUPLICATE_2248_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l2946_l2862_DUPLICATE_2248_return_output;
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
