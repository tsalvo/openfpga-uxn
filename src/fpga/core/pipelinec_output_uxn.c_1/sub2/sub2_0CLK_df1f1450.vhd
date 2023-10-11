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
entity sub2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_df1f1450;
architecture arch of sub2_0CLK_df1f1450 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2723_c6_16f5]
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_8a77]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2723_c2_2a16]
signal tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2723_c2_2a16]
signal t16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2723_c2_2a16]
signal n16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2723_c2_2a16]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2723_c2_2a16]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2723_c2_2a16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2723_c2_2a16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2723_c2_2a16]
signal result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2723_c2_2a16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2724_c3_25f0[uxn_opcodes_h_l2724_c3_25f0]
signal printf_uxn_opcodes_h_l2724_c3_25f0_uxn_opcodes_h_l2724_c3_25f0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_b2fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2728_c7_cade]
signal tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2728_c7_cade]
signal t16_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2728_c7_cade]
signal n16_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2728_c7_cade]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2728_c7_cade]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2728_c7_cade]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2728_c7_cade]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2728_c7_cade]
signal result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2728_c7_cade]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_98aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2731_c7_0059]
signal tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2731_c7_0059]
signal t16_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2731_c7_0059]
signal n16_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2731_c7_0059]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2731_c7_0059]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_0059]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2731_c7_0059]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2731_c7_0059]
signal result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_0059]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_0049]
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2736_c7_5fbe]
signal tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2736_c7_5fbe]
signal t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2736_c7_5fbe]
signal n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2736_c7_5fbe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2736_c7_5fbe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2736_c7_5fbe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2736_c7_5fbe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2736_c7_5fbe]
signal result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2736_c7_5fbe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_b658]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2739_c7_6d7b]
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2739_c7_6d7b]
signal t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2739_c7_6d7b]
signal n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2739_c7_6d7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2739_c7_6d7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_6d7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2739_c7_6d7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2739_c7_6d7b]
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_6d7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2740_c3_2223]
signal BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_f486]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2743_c7_a2e1]
signal tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2743_c7_a2e1]
signal n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2743_c7_a2e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2743_c7_a2e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_a2e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2743_c7_a2e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2743_c7_a2e1]
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_a2e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_7972]
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2746_c7_1ab3]
signal tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2746_c7_1ab3]
signal n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2746_c7_1ab3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2746_c7_1ab3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2746_c7_1ab3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2746_c7_1ab3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2746_c7_1ab3]
signal result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2746_c7_1ab3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_aa7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2751_c7_58d0]
signal tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2751_c7_58d0]
signal n16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2751_c7_58d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2751_c7_58d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2751_c7_58d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2751_c7_58d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2751_c7_58d0]
signal result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2751_c7_58d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_e55e]
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2754_c7_d81c]
signal tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2754_c7_d81c]
signal n16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2754_c7_d81c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2754_c7_d81c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2754_c7_d81c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2754_c7_d81c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2754_c7_d81c]
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2754_c7_d81c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2755_c3_3dbc]
signal BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2756_c11_a4ee]
signal BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2758_c32_685a]
signal BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2758_c32_a1a2]
signal BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2758_c32_6b0c]
signal MUX_uxn_opcodes_h_l2758_c32_6b0c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2758_c32_6b0c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2758_c32_6b0c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2758_c32_6b0c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_3d22]
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2760_c7_ff2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2760_c7_ff2c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2760_c7_ff2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2760_c7_ff2c]
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2760_c7_ff2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_eac5]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_edce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2766_c7_edce]
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_edce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_edce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2768_c34_647b]
signal CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_9105]
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2770_c7_2344]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2770_c7_2344]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5
BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_left,
BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_right,
BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16
tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond,
tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue,
tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse,
tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output);

-- t16_MUX_uxn_opcodes_h_l2723_c2_2a16
t16_MUX_uxn_opcodes_h_l2723_c2_2a16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond,
t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue,
t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse,
t16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output);

-- n16_MUX_uxn_opcodes_h_l2723_c2_2a16
n16_MUX_uxn_opcodes_h_l2723_c2_2a16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond,
n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue,
n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse,
n16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16
result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_cond,
result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output);

-- printf_uxn_opcodes_h_l2724_c3_25f0_uxn_opcodes_h_l2724_c3_25f0
printf_uxn_opcodes_h_l2724_c3_25f0_uxn_opcodes_h_l2724_c3_25f0 : entity work.printf_uxn_opcodes_h_l2724_c3_25f0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2724_c3_25f0_uxn_opcodes_h_l2724_c3_25f0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2728_c7_cade
tmp16_MUX_uxn_opcodes_h_l2728_c7_cade : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_cond,
tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue,
tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse,
tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output);

-- t16_MUX_uxn_opcodes_h_l2728_c7_cade
t16_MUX_uxn_opcodes_h_l2728_c7_cade : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2728_c7_cade_cond,
t16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue,
t16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse,
t16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output);

-- n16_MUX_uxn_opcodes_h_l2728_c7_cade
n16_MUX_uxn_opcodes_h_l2728_c7_cade : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2728_c7_cade_cond,
n16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue,
n16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse,
n16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade
result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade
result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_cond,
result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2731_c7_0059
tmp16_MUX_uxn_opcodes_h_l2731_c7_0059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_cond,
tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue,
tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse,
tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output);

-- t16_MUX_uxn_opcodes_h_l2731_c7_0059
t16_MUX_uxn_opcodes_h_l2731_c7_0059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2731_c7_0059_cond,
t16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue,
t16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse,
t16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output);

-- n16_MUX_uxn_opcodes_h_l2731_c7_0059
n16_MUX_uxn_opcodes_h_l2731_c7_0059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2731_c7_0059_cond,
n16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue,
n16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse,
n16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059
result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_cond,
result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_left,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_right,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe
tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond,
tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue,
tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse,
tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output);

-- t16_MUX_uxn_opcodes_h_l2736_c7_5fbe
t16_MUX_uxn_opcodes_h_l2736_c7_5fbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond,
t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue,
t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse,
t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output);

-- n16_MUX_uxn_opcodes_h_l2736_c7_5fbe
n16_MUX_uxn_opcodes_h_l2736_c7_5fbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond,
n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue,
n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse,
n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe
result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe
result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond,
result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b
tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond,
tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output);

-- t16_MUX_uxn_opcodes_h_l2739_c7_6d7b
t16_MUX_uxn_opcodes_h_l2739_c7_6d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond,
t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue,
t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse,
t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output);

-- n16_MUX_uxn_opcodes_h_l2739_c7_6d7b
n16_MUX_uxn_opcodes_h_l2739_c7_6d7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond,
n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue,
n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse,
n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223
BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_left,
BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_right,
BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1
tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond,
tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output);

-- n16_MUX_uxn_opcodes_h_l2743_c7_a2e1
n16_MUX_uxn_opcodes_h_l2743_c7_a2e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond,
n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue,
n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse,
n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1
result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_left,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_right,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3
tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond,
tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output);

-- n16_MUX_uxn_opcodes_h_l2746_c7_1ab3
n16_MUX_uxn_opcodes_h_l2746_c7_1ab3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond,
n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue,
n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse,
n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3
result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3
result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0
tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond,
tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output);

-- n16_MUX_uxn_opcodes_h_l2751_c7_58d0
n16_MUX_uxn_opcodes_h_l2751_c7_58d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond,
n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue,
n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse,
n16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0
result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0
result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0
result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_left,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_right,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c
tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond,
tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output);

-- n16_MUX_uxn_opcodes_h_l2754_c7_d81c
n16_MUX_uxn_opcodes_h_l2754_c7_d81c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond,
n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue,
n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse,
n16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc
BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_left,
BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_right,
BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee
BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_left,
BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_right,
BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a
BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_left,
BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_right,
BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2
BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_left,
BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_right,
BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_return_output);

-- MUX_uxn_opcodes_h_l2758_c32_6b0c
MUX_uxn_opcodes_h_l2758_c32_6b0c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2758_c32_6b0c_cond,
MUX_uxn_opcodes_h_l2758_c32_6b0c_iftrue,
MUX_uxn_opcodes_h_l2758_c32_6b0c_iffalse,
MUX_uxn_opcodes_h_l2758_c32_6b0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_left,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_right,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_cond,
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2768_c34_647b
CONST_SR_8_uxn_opcodes_h_l2768_c34_647b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_x,
CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_left,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_right,
BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda
CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_return_output,
 tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
 t16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
 n16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output,
 tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output,
 t16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output,
 n16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output,
 tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output,
 t16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output,
 n16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output,
 tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output,
 t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output,
 n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output,
 tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output,
 t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output,
 n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output,
 tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output,
 n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output,
 tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output,
 n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output,
 n16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output,
 n16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_return_output,
 MUX_uxn_opcodes_h_l2758_c32_6b0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_return_output,
 CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_98c1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2724_c3_25f0_uxn_opcodes_h_l2724_c3_25f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_938d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2734_c3_1017 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2737_c3_9c30 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2741_c3_1c96 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_689f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2749_c3_7440 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_e6d7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_f79a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2764_c24_ef03_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2767_c3_2021 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2768_c24_eb4b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2732_l2740_l2747_l2755_DUPLICATE_76f4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2754_DUPLICATE_f818_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2719_l2775_DUPLICATE_bb76_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2767_c3_2021 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2767_c3_2021;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2737_c3_9c30 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2737_c3_9c30;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_689f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_689f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_f79a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_f79a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2749_c3_7440 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2749_c3_7440;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_938d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_938d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2734_c3_1017 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2734_c3_1017;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_e6d7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_e6d7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_98c1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_98c1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2741_c3_1c96 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2741_c3_1c96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_eac5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2754_DUPLICATE_f818 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2754_DUPLICATE_f818_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_0049] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_left;
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output := BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2758_c32_685a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_left;
     BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_return_output := BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2732_l2740_l2747_l2755_DUPLICATE_76f4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2732_l2740_l2747_l2755_DUPLICATE_76f4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_3d22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_left;
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_return_output := BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_7972] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_left;
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output := BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2770_c11_9105] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_left;
     BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_return_output := BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_b658] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_aa7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_98aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2723_c6_16f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_e55e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_b2fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2764_c24_ef03] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2764_c24_ef03_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_SR_8[uxn_opcodes_h_l2768_c34_647b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_return_output := CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_f486] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2758_c32_685a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c6_16f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_b2fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_98aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_0049_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_b658_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_f486_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_7972_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_aa7e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_e55e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3d22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_eac5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2770_c11_9105_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2732_l2740_l2747_l2755_DUPLICATE_76f4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2732_l2740_l2747_l2755_DUPLICATE_76f4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2732_l2740_l2747_l2755_DUPLICATE_76f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2764_c24_ef03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2739_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_8b58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2760_l2731_l2754_l2728_l2751_l2746_l2743_l2770_DUPLICATE_fe65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2739_l2736_l2760_l2731_l2728_l2751_l2723_l2746_l2743_DUPLICATE_eb98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_l2770_DUPLICATE_fc38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2754_DUPLICATE_f818_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2766_l2754_DUPLICATE_f818_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2739_l2766_l2736_l2731_l2754_l2728_l2751_l2723_l2746_l2743_DUPLICATE_b1a6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2760_c7_ff2c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2770_c7_2344] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_8a77] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2740_c3_2223] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_left;
     BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_return_output := BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2768_c24_eb4b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2768_c24_eb4b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2768_c34_647b_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2755_c3_3dbc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_left;
     BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_return_output := BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_edce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2758_c32_a1a2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_left;
     BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_return_output := BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2770_c7_2344] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2758_c32_a1a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2740_c3_2223_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2755_c3_3dbc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2768_c24_eb4b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2733_l2748_DUPLICATE_2bda_return_output;
     VAR_printf_uxn_opcodes_h_l2724_c3_25f0_uxn_opcodes_h_l2724_c3_25f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_8a77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2770_c7_2344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2770_c7_2344_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_edce_return_output;
     -- printf_uxn_opcodes_h_l2724_c3_25f0[uxn_opcodes_h_l2724_c3_25f0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2724_c3_25f0_uxn_opcodes_h_l2724_c3_25f0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2724_c3_25f0_uxn_opcodes_h_l2724_c3_25f0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2760_c7_ff2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2766_c7_edce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_return_output := result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_edce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_return_output;

     -- t16_MUX[uxn_opcodes_h_l2739_c7_6d7b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond;
     t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue;
     t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output := t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2754_c7_d81c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2754_c7_d81c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond;
     n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue;
     n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output := n16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;

     -- MUX[uxn_opcodes_h_l2758_c32_6b0c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2758_c32_6b0c_cond <= VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_cond;
     MUX_uxn_opcodes_h_l2758_c32_6b0c_iftrue <= VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_iftrue;
     MUX_uxn_opcodes_h_l2758_c32_6b0c_iffalse <= VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_return_output := MUX_uxn_opcodes_h_l2758_c32_6b0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_edce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2756_c11_a4ee] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2756_c11_a4ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue := VAR_MUX_uxn_opcodes_h_l2758_c32_6b0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_edce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_edce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2766_c7_edce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2760_c7_ff2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2754_c7_d81c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2751_c7_58d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2760_c7_ff2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2760_c7_ff2c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2751_c7_58d0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond;
     n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue;
     n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output := n16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2754_c7_d81c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2736_c7_5fbe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond <= VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond;
     t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue;
     t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output := t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2754_c7_d81c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_cond;
     tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output := tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2760_c7_ff2c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2751_c7_58d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2754_c7_d81c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2754_c7_d81c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2754_c7_d81c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2731_c7_0059] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2731_c7_0059_cond <= VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_cond;
     t16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue;
     t16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output := t16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2751_c7_58d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2746_c7_1ab3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond;
     n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue;
     n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output := n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2751_c7_58d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_cond;
     tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output := tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2746_c7_1ab3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_d81c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2751_c7_58d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2728_c7_cade] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2728_c7_cade_cond <= VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_cond;
     t16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue;
     t16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output := t16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2746_c7_1ab3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond;
     tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output := tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2751_c7_58d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2751_c7_58d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2746_c7_1ab3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2746_c7_1ab3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2743_c7_a2e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2743_c7_a2e1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond;
     n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue;
     n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output := n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2751_c7_58d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;
     -- n16_MUX[uxn_opcodes_h_l2739_c7_6d7b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond;
     n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue;
     n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output := n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2743_c7_a2e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2746_c7_1ab3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2723_c2_2a16] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond <= VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond;
     t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue;
     t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output := t16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2746_c7_1ab3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2746_c7_1ab3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_a2e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2743_c7_a2e1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond;
     tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output := tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2739_c7_6d7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2746_c7_1ab3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2739_c7_6d7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2736_c7_5fbe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_a2e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_6d7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2743_c7_a2e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2743_c7_a2e1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2739_c7_6d7b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond;
     tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output := tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2736_c7_5fbe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond <= VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond;
     n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue;
     n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output := n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2743_c7_a2e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_6d7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2736_c7_5fbe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond;
     tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output := tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2736_c7_5fbe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2739_c7_6d7b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2739_c7_6d7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2736_c7_5fbe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;

     -- n16_MUX[uxn_opcodes_h_l2731_c7_0059] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2731_c7_0059_cond <= VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_cond;
     n16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue;
     n16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output := n16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2731_c7_0059] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2739_c7_6d7b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2731_c7_0059] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_cond;
     tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output := tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2736_c7_5fbe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2736_c7_5fbe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_0059] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2731_c7_0059] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;

     -- n16_MUX[uxn_opcodes_h_l2728_c7_cade] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2728_c7_cade_cond <= VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_cond;
     n16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue;
     n16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output := n16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2728_c7_cade] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2736_c7_5fbe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output := result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2736_c7_5fbe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2728_c7_cade] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2731_c7_0059] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_return_output := result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;

     -- n16_MUX[uxn_opcodes_h_l2723_c2_2a16] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond <= VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond;
     n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue;
     n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output := n16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_0059] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2731_c7_0059] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2723_c2_2a16] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2728_c7_cade] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_cond;
     tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output := tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2728_c7_cade] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2731_c7_0059_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2723_c2_2a16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2728_c7_cade] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_return_output := result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2723_c2_2a16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2728_c7_cade] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2728_c7_cade] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2723_c2_2a16] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_cond;
     tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output := tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2728_c7_cade_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2723_c2_2a16] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output := result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2723_c2_2a16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2723_c2_2a16] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2719_l2775_DUPLICATE_bb76 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2719_l2775_DUPLICATE_bb76_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c2_2a16_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2719_l2775_DUPLICATE_bb76_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2719_l2775_DUPLICATE_bb76_return_output;
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
