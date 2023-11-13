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
-- Submodules: 71
entity sft2_0CLK_77062510 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_77062510;
architecture arch of sft2_0CLK_77062510 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2133_c6_debd]
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2133_c1_5441]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2133_c2_9704]
signal t8_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c2_9704]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c2_9704]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c2_9704]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c2_9704]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c2_9704]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2133_c2_9704]
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2133_c2_9704]
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2133_c2_9704]
signal n16_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2134_c3_ff8a[uxn_opcodes_h_l2134_c3_ff8a]
signal printf_uxn_opcodes_h_l2134_c3_ff8a_uxn_opcodes_h_l2134_c3_ff8a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_3bfa]
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2138_c7_bfb8]
signal t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_bfb8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2138_c7_bfb8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_bfb8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_bfb8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_bfb8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_bfb8]
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2138_c7_bfb8]
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2138_c7_bfb8]
signal n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_8a63]
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2141_c7_56de]
signal t8_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_56de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_56de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_56de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_56de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_56de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_56de]
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2141_c7_56de]
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2141_c7_56de]
signal n16_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_30a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_abb9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2145_c7_abb9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_abb9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2145_c7_abb9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_abb9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2145_c7_abb9]
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2145_c7_abb9]
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2145_c7_abb9]
signal n16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2147_c3_6308]
signal CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_2c93]
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_cc56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_cc56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_cc56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_cc56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_cc56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2149_c7_cc56]
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2149_c7_cc56]
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2149_c7_cc56]
signal n16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2150_c3_846f]
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2152_c30_7f47]
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2153_c20_5641]
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2153_c12_18b0]
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2153_c36_f284]
signal CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2153_c12_6070]
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2158_c11_e2d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c7_71e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2158_c7_71e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c7_71e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c7_71e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2158_c7_71e0]
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2161_c31_4584]
signal CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2163_c11_f61d]
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2163_c7_0acb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2163_c7_0acb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_left,
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_right,
BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_return_output);

-- t8_MUX_uxn_opcodes_h_l2133_c2_9704
t8_MUX_uxn_opcodes_h_l2133_c2_9704 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2133_c2_9704_cond,
t8_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue,
t8_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse,
t8_MUX_uxn_opcodes_h_l2133_c2_9704_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_cond,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2133_c2_9704
tmp16_MUX_uxn_opcodes_h_l2133_c2_9704 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_cond,
tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue,
tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse,
tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output);

-- n16_MUX_uxn_opcodes_h_l2133_c2_9704
n16_MUX_uxn_opcodes_h_l2133_c2_9704 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2133_c2_9704_cond,
n16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue,
n16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse,
n16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output);

-- printf_uxn_opcodes_h_l2134_c3_ff8a_uxn_opcodes_h_l2134_c3_ff8a
printf_uxn_opcodes_h_l2134_c3_ff8a_uxn_opcodes_h_l2134_c3_ff8a : entity work.printf_uxn_opcodes_h_l2134_c3_ff8a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2134_c3_ff8a_uxn_opcodes_h_l2134_c3_ff8a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_left,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_right,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output);

-- t8_MUX_uxn_opcodes_h_l2138_c7_bfb8
t8_MUX_uxn_opcodes_h_l2138_c7_bfb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond,
t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue,
t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse,
t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8
tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond,
tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output);

-- n16_MUX_uxn_opcodes_h_l2138_c7_bfb8
n16_MUX_uxn_opcodes_h_l2138_c7_bfb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond,
n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue,
n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse,
n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_left,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_right,
BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output);

-- t8_MUX_uxn_opcodes_h_l2141_c7_56de
t8_MUX_uxn_opcodes_h_l2141_c7_56de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2141_c7_56de_cond,
t8_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue,
t8_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse,
t8_MUX_uxn_opcodes_h_l2141_c7_56de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_cond,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2141_c7_56de
tmp16_MUX_uxn_opcodes_h_l2141_c7_56de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_cond,
tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue,
tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse,
tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output);

-- n16_MUX_uxn_opcodes_h_l2141_c7_56de
n16_MUX_uxn_opcodes_h_l2141_c7_56de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2141_c7_56de_cond,
n16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue,
n16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse,
n16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9
tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond,
tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output);

-- n16_MUX_uxn_opcodes_h_l2145_c7_abb9
n16_MUX_uxn_opcodes_h_l2145_c7_abb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond,
n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue,
n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse,
n16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2147_c3_6308
CONST_SL_8_uxn_opcodes_h_l2147_c3_6308 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_x,
CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_left,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_right,
BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_cond,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56
tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond,
tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue,
tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse,
tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output);

-- n16_MUX_uxn_opcodes_h_l2149_c7_cc56
n16_MUX_uxn_opcodes_h_l2149_c7_cc56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond,
n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue,
n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse,
n16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f
BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_left,
BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_right,
BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47
sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_ins,
sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_x,
sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_y,
sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641
BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_left,
BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_right,
BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0
BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_left,
BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_right,
BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2153_c36_f284
CONST_SR_4_uxn_opcodes_h_l2153_c36_f284 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_x,
CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070
BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_left,
BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_right,
BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2161_c31_4584
CONST_SR_8_uxn_opcodes_h_l2161_c31_4584 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_x,
CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_left,
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_right,
BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_return_output,
 t8_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
 tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
 n16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output,
 t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output,
 n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output,
 t8_MUX_uxn_opcodes_h_l2141_c7_56de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_return_output,
 tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output,
 n16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output,
 n16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output,
 CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output,
 tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output,
 n16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_return_output,
 sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_return_output,
 CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output,
 CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_de0a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2134_c3_ff8a_uxn_opcodes_h_l2134_c3_ff8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_87fb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_3677 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_82d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_642b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_ecb7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_2690_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d919_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_30ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_00e6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d5f0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_83ab_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_3cb2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2158_DUPLICATE_7a7b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2168_l2128_DUPLICATE_4479_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_de0a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2135_c3_de0a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_87fb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2139_c3_87fb;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_3677 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2143_c3_3677;
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_82d2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2155_c3_82d2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_ecb7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2160_c3_ecb7;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_83ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_83ab_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2133_c6_debd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2158_DUPLICATE_7a7b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2158_DUPLICATE_7a7b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2158_c11_e2d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2149_c11_2c93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_left;
     BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output := BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_00e6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_00e6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d5f0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d5f0_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2141_c11_8a63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_left;
     BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output := BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2153_c36_f284] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_return_output := CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2152_c30_7f47] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_ins;
     sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_x;
     sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_return_output := sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d919 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d919_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_30ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_30ea_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l2153_c20_5641] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_left;
     BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_return_output := BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2163_c11_f61d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2145_c11_30a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2161_c31_4584] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_return_output := CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_3cb2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_3cb2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_3bfa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2153_c20_5641_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2133_c6_debd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_3bfa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2141_c11_8a63_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2145_c11_30a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2149_c11_2c93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2158_c11_e2d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2163_c11_f61d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_3cb2_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2146_l2150_DUPLICATE_3cb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_00e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_00e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_00e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_00e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2149_DUPLICATE_00e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_83ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_83ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_83ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_83ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_83ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2163_l2158_l2149_DUPLICATE_83ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d919_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d919_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d919_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d919_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d919_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_30ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_30ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_30ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_30ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_30ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2163_l2158_DUPLICATE_30ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2158_DUPLICATE_7a7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2145_l2158_DUPLICATE_7a7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d5f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d5f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d5f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d5f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2145_l2141_l2138_l2133_l2158_DUPLICATE_d5f0_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_right := VAR_CONST_SR_4_uxn_opcodes_h_l2153_c36_f284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2152_c30_7f47_return_output;
     -- t8_MUX[uxn_opcodes_h_l2141_c7_56de] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2141_c7_56de_cond <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_cond;
     t8_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue;
     t8_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_return_output := t8_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2163_c7_0acb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2150_c3_846f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_left;
     BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_return_output := BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2158_c7_71e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2163_c7_0acb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2133_c1_5441] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2158_c7_71e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2161_c21_2690] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_2690_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2161_c31_4584_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2149_c7_cc56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2147_c3_6308] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_return_output := CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2150_c3_846f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2161_c21_2690_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2147_c3_6308_return_output;
     VAR_printf_uxn_opcodes_h_l2134_c3_ff8a_uxn_opcodes_h_l2134_c3_ff8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2133_c1_5441_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2163_c7_0acb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2158_c7_71e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2158_c7_71e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2149_c7_cc56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;

     -- t8_MUX[uxn_opcodes_h_l2138_c7_bfb8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond;
     t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue;
     t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output := t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;

     -- printf_uxn_opcodes_h_l2134_c3_ff8a[uxn_opcodes_h_l2134_c3_ff8a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2134_c3_ff8a_uxn_opcodes_h_l2134_c3_ff8a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2134_c3_ff8a_uxn_opcodes_h_l2134_c3_ff8a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2158_c7_71e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2149_c7_cc56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2153_c12_18b0] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_left;
     BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_return_output := BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2149_c7_cc56] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond;
     n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue;
     n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output := n16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2145_c7_abb9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2153_c12_18b0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2158_c7_71e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2149_c7_cc56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;

     -- t8_MUX[uxn_opcodes_h_l2133_c2_9704] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2133_c2_9704_cond <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_cond;
     t8_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue;
     t8_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_return_output := t8_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2153_c12_6070] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_left;
     BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_return_output := BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_return_output;

     -- n16_MUX[uxn_opcodes_h_l2145_c7_abb9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond;
     n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue;
     n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output := n16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2141_c7_56de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2145_c7_abb9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2149_c7_cc56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2145_c7_abb9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2141_c7_56de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2145_c7_abb9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2156_c21_642b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_642b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2153_c12_6070_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2141_c7_56de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_bfb8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2149_c7_cc56] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_cond;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output := tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;

     -- n16_MUX[uxn_opcodes_h_l2141_c7_56de] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2141_c7_56de_cond <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_cond;
     n16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue;
     n16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output := n16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2145_c7_abb9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2156_c21_642b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2141_c7_56de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2141_c7_56de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2138_c7_bfb8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2149_c7_cc56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output := result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;

     -- n16_MUX[uxn_opcodes_h_l2138_c7_bfb8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond;
     n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue;
     n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output := n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2133_c2_9704] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_bfb8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2145_c7_abb9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_cond;
     tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output := tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2149_c7_cc56_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;
     -- n16_MUX[uxn_opcodes_h_l2133_c2_9704] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2133_c2_9704_cond <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_cond;
     n16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue;
     n16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output := n16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_bfb8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_bfb8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2133_c2_9704] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2133_c2_9704] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2141_c7_56de] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_cond;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output := tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2145_c7_abb9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2145_c7_abb9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2141_c7_56de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_return_output := result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2133_c2_9704] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2138_c7_bfb8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output := tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2133_c2_9704] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2141_c7_56de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2133_c2_9704] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_cond;
     tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output := tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_bfb8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_bfb8_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2133_c2_9704] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_return_output := result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2168_l2128_DUPLICATE_4479 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2168_l2128_DUPLICATE_4479_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2133_c2_9704_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2133_c2_9704_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2168_l2128_DUPLICATE_4479_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2168_l2128_DUPLICATE_4479_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
