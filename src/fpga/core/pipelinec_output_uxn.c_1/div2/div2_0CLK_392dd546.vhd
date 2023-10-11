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
-- Submodules: 116
entity div2_0CLK_392dd546 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_392dd546;
architecture arch of div2_0CLK_392dd546 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2270_c6_780b]
signal BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2270_c1_4a30]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2270_c2_908b]
signal n16_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2270_c2_908b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2270_c2_908b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2270_c2_908b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2270_c2_908b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2270_c2_908b]
signal result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2270_c2_908b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2270_c2_908b]
signal tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2270_c2_908b]
signal t16_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2271_c3_9a48[uxn_opcodes_h_l2271_c3_9a48]
signal printf_uxn_opcodes_h_l2271_c3_9a48_uxn_opcodes_h_l2271_c3_9a48_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_7592]
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2275_c7_23c6]
signal n16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_23c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_23c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_23c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_23c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2275_c7_23c6]
signal result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2275_c7_23c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2275_c7_23c6]
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2275_c7_23c6]
signal t16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2278_c11_2aa8]
signal BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2278_c7_d677]
signal n16_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2278_c7_d677]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2278_c7_d677]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2278_c7_d677]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2278_c7_d677]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2278_c7_d677]
signal result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2278_c7_d677]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2278_c7_d677]
signal tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2278_c7_d677]
signal t16_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_a7ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2283_c7_5a28]
signal n16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2283_c7_5a28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_5a28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_5a28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_5a28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2283_c7_5a28]
signal result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2283_c7_5a28]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2283_c7_5a28]
signal tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2283_c7_5a28]
signal t16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2286_c11_141c]
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2286_c7_ac06]
signal n16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2286_c7_ac06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2286_c7_ac06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2286_c7_ac06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2286_c7_ac06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2286_c7_ac06]
signal result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2286_c7_ac06]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2286_c7_ac06]
signal tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2286_c7_ac06]
signal t16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2287_c3_f496]
signal BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_86dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2290_c7_adbe]
signal n16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_adbe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_adbe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_adbe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_adbe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2290_c7_adbe]
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2290_c7_adbe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2290_c7_adbe]
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2293_c11_a5e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2293_c7_8a73]
signal n16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c7_8a73]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c7_8a73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c7_8a73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c7_8a73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2293_c7_8a73]
signal result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c7_8a73]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2293_c7_8a73]
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_1ab3]
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2298_c7_62c0]
signal n16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_62c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_62c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_62c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_62c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2298_c7_62c0]
signal result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_62c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2298_c7_62c0]
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_9f93]
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2301_c7_3c28]
signal n16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_3c28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_3c28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_3c28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_3c28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2301_c7_3c28]
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_3c28]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2301_c7_3c28]
signal tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2302_c3_7c9c]
signal BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2303_c11_41c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2303_c26_bebb]
signal BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2303_c11_af33]
signal MUX_uxn_opcodes_h_l2303_c11_af33_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2303_c11_af33_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2303_c11_af33_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2303_c11_af33_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2305_c32_b556]
signal BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2305_c32_d65a]
signal BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2305_c32_6459]
signal MUX_uxn_opcodes_h_l2305_c32_6459_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2305_c32_6459_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2305_c32_6459_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2305_c32_6459_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2307_c11_ae6e]
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2307_c7_b3a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2307_c7_b3a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2307_c7_b3a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2307_c7_b3a4]
signal result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2307_c7_b3a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2313_c11_baca]
signal BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2313_c7_6e5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2313_c7_6e5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2313_c7_6e5f]
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2313_c7_6e5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2315_c34_00bd]
signal CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_4f6e]
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_9960]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_9960]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b
BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_left,
BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_right,
BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_return_output);

-- n16_MUX_uxn_opcodes_h_l2270_c2_908b
n16_MUX_uxn_opcodes_h_l2270_c2_908b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2270_c2_908b_cond,
n16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue,
n16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse,
n16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b
result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b
result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2270_c2_908b
tmp16_MUX_uxn_opcodes_h_l2270_c2_908b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_cond,
tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output);

-- t16_MUX_uxn_opcodes_h_l2270_c2_908b
t16_MUX_uxn_opcodes_h_l2270_c2_908b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2270_c2_908b_cond,
t16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue,
t16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse,
t16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output);

-- printf_uxn_opcodes_h_l2271_c3_9a48_uxn_opcodes_h_l2271_c3_9a48
printf_uxn_opcodes_h_l2271_c3_9a48_uxn_opcodes_h_l2271_c3_9a48 : entity work.printf_uxn_opcodes_h_l2271_c3_9a48_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2271_c3_9a48_uxn_opcodes_h_l2271_c3_9a48_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_left,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_right,
BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output);

-- n16_MUX_uxn_opcodes_h_l2275_c7_23c6
n16_MUX_uxn_opcodes_h_l2275_c7_23c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond,
n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue,
n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse,
n16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6
result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6
result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6
tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond,
tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output);

-- t16_MUX_uxn_opcodes_h_l2275_c7_23c6
t16_MUX_uxn_opcodes_h_l2275_c7_23c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond,
t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue,
t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse,
t16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8
BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_left,
BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_right,
BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output);

-- n16_MUX_uxn_opcodes_h_l2278_c7_d677
n16_MUX_uxn_opcodes_h_l2278_c7_d677 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2278_c7_d677_cond,
n16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue,
n16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse,
n16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677
result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_cond,
result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2278_c7_d677
tmp16_MUX_uxn_opcodes_h_l2278_c7_d677 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_cond,
tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue,
tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse,
tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output);

-- t16_MUX_uxn_opcodes_h_l2278_c7_d677
t16_MUX_uxn_opcodes_h_l2278_c7_d677 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2278_c7_d677_cond,
t16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue,
t16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse,
t16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output);

-- n16_MUX_uxn_opcodes_h_l2283_c7_5a28
n16_MUX_uxn_opcodes_h_l2283_c7_5a28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond,
n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue,
n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse,
n16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28
result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_cond,
result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28
tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond,
tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue,
tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse,
tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output);

-- t16_MUX_uxn_opcodes_h_l2283_c7_5a28
t16_MUX_uxn_opcodes_h_l2283_c7_5a28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond,
t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue,
t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse,
t16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_left,
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_right,
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output);

-- n16_MUX_uxn_opcodes_h_l2286_c7_ac06
n16_MUX_uxn_opcodes_h_l2286_c7_ac06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond,
n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue,
n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse,
n16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06
result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_cond,
result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06
tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond,
tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue,
tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse,
tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output);

-- t16_MUX_uxn_opcodes_h_l2286_c7_ac06
t16_MUX_uxn_opcodes_h_l2286_c7_ac06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond,
t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue,
t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse,
t16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496
BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_left,
BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_right,
BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output);

-- n16_MUX_uxn_opcodes_h_l2290_c7_adbe
n16_MUX_uxn_opcodes_h_l2290_c7_adbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond,
n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue,
n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse,
n16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_cond,
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe
tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond,
tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue,
tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse,
tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output);

-- n16_MUX_uxn_opcodes_h_l2293_c7_8a73
n16_MUX_uxn_opcodes_h_l2293_c7_8a73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond,
n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue,
n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse,
n16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73
result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_cond,
result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73
tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond,
tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue,
tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse,
tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_left,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_right,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output);

-- n16_MUX_uxn_opcodes_h_l2298_c7_62c0
n16_MUX_uxn_opcodes_h_l2298_c7_62c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond,
n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue,
n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse,
n16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0
result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0
tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond,
tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_left,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_right,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output);

-- n16_MUX_uxn_opcodes_h_l2301_c7_3c28
n16_MUX_uxn_opcodes_h_l2301_c7_3c28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond,
n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue,
n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse,
n16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_cond,
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28
tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond,
tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue,
tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse,
tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c
BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_left,
BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_right,
BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0
BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb
BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_left,
BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_right,
BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_return_output);

-- MUX_uxn_opcodes_h_l2303_c11_af33
MUX_uxn_opcodes_h_l2303_c11_af33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2303_c11_af33_cond,
MUX_uxn_opcodes_h_l2303_c11_af33_iftrue,
MUX_uxn_opcodes_h_l2303_c11_af33_iffalse,
MUX_uxn_opcodes_h_l2303_c11_af33_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556
BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_left,
BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_right,
BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a
BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_left,
BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_right,
BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_return_output);

-- MUX_uxn_opcodes_h_l2305_c32_6459
MUX_uxn_opcodes_h_l2305_c32_6459 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2305_c32_6459_cond,
MUX_uxn_opcodes_h_l2305_c32_6459_iftrue,
MUX_uxn_opcodes_h_l2305_c32_6459_iffalse,
MUX_uxn_opcodes_h_l2305_c32_6459_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_left,
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_right,
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4
result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4
result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4
result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_left,
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_right,
BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd
CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_x,
CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_left,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_right,
BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff
CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_return_output,
 n16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
 t16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output,
 n16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output,
 t16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output,
 n16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output,
 tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output,
 t16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output,
 n16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output,
 tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output,
 t16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output,
 n16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output,
 tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output,
 t16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output,
 n16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output,
 tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output,
 n16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output,
 tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output,
 n16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output,
 n16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output,
 tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_return_output,
 MUX_uxn_opcodes_h_l2303_c11_af33_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_return_output,
 MUX_uxn_opcodes_h_l2305_c32_6459_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2272_c3_88f0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2271_c3_9a48_uxn_opcodes_h_l2271_c3_9a48_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_1066 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_5cbf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_f3df : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_b545 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_15da : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2296_c3_4b18 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_32ab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2303_c11_af33_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2303_c11_af33_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2303_c11_af33_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2303_c11_af33_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2305_c32_6459_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2305_c32_6459_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2305_c32_6459_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2305_c32_6459_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2310_c3_6a46 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2311_c24_7dd6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_d220 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c24_0f69_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2279_l2287_l2294_l2302_DUPLICATE_4d37_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2313_l2301_DUPLICATE_212e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2322_l2266_DUPLICATE_6f68_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_5cbf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2281_c3_5cbf;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2305_c32_6459_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_15da := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2291_c3_15da;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_f3df := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2284_c3_f3df;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2296_c3_4b18 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2296_c3_4b18;
     VAR_MUX_uxn_opcodes_h_l2305_c32_6459_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_32ab := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_32ab;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_b545 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2288_c3_b545;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l2303_c11_af33_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2310_c3_6a46 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2310_c3_6a46;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_1066 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2276_c3_1066;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2272_c3_88f0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2272_c3_88f0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_d220 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_d220;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2290_c11_86dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2279_l2287_l2294_l2302_DUPLICATE_4d37 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2279_l2287_l2294_l2302_DUPLICATE_4d37_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2275_c11_7592] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_left;
     BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output := BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2278_c11_2aa8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_1ab3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2311_c24_7dd6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2311_c24_7dd6_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l2315_c34_00bd] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_return_output := CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2305_c32_b556] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_left;
     BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_return_output := BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2313_c11_baca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2303_c11_41c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2317_c11_4f6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2293_c11_a5e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2313_l2301_DUPLICATE_212e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2313_l2301_DUPLICATE_212e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2270_c6_780b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2283_c11_a7ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_9f93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_left;
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output := BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2307_c11_ae6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2286_c11_141c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2305_c32_b556_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2270_c6_780b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2275_c11_7592_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2278_c11_2aa8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2283_c11_a7ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_141c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2290_c11_86dd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2293_c11_a5e6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_1ab3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_9f93_return_output;
     VAR_MUX_uxn_opcodes_h_l2303_c11_af33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2303_c11_41c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_ae6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2313_c11_baca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2317_c11_4f6e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2279_l2287_l2294_l2302_DUPLICATE_4d37_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2279_l2287_l2294_l2302_DUPLICATE_4d37_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2279_l2287_l2294_l2302_DUPLICATE_4d37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2311_c24_7dd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2278_l2301_l2275_DUPLICATE_2ace_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2298_l2293_l2290_l2317_l2286_l2313_l2283_l2307_l2278_l2301_l2275_DUPLICATE_2310_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2283_l2307_l2278_l2275_DUPLICATE_8a30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2317_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_e913_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2313_l2301_DUPLICATE_212e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2313_l2301_DUPLICATE_212e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2298_l2270_l2293_l2290_l2286_l2313_l2283_l2278_l2301_l2275_DUPLICATE_ff6d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2270_c1_4a30] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2317_c7_9960] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2305_c32_d65a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_left;
     BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_return_output := BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2315_c24_0f69] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c24_0f69_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2315_c34_00bd_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2313_c7_6e5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2317_c7_9960] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2287_c3_f496] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_left;
     BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_return_output := BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2302_c3_7c9c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_left;
     BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_return_output := BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2307_c7_b3a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2305_c32_6459_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2305_c32_d65a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2287_c3_f496_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2302_c3_7c9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2315_c24_0f69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2280_l2295_DUPLICATE_f3ff_return_output;
     VAR_printf_uxn_opcodes_h_l2271_c3_9a48_uxn_opcodes_h_l2271_c3_9a48_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2270_c1_4a30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2317_c7_9960_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2317_c7_9960_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output;
     -- t16_MUX[uxn_opcodes_h_l2286_c7_ac06] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond <= VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond;
     t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue;
     t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output := t16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_3c28] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;

     -- n16_MUX[uxn_opcodes_h_l2301_c7_3c28] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond <= VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond;
     n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue;
     n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output := n16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;

     -- MUX[uxn_opcodes_h_l2305_c32_6459] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2305_c32_6459_cond <= VAR_MUX_uxn_opcodes_h_l2305_c32_6459_cond;
     MUX_uxn_opcodes_h_l2305_c32_6459_iftrue <= VAR_MUX_uxn_opcodes_h_l2305_c32_6459_iftrue;
     MUX_uxn_opcodes_h_l2305_c32_6459_iffalse <= VAR_MUX_uxn_opcodes_h_l2305_c32_6459_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2305_c32_6459_return_output := MUX_uxn_opcodes_h_l2305_c32_6459_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2303_c26_bebb] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_left;
     BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_return_output := BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2313_c7_6e5f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2313_c7_6e5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2307_c7_b3a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2313_c7_6e5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output;

     -- printf_uxn_opcodes_h_l2271_c3_9a48[uxn_opcodes_h_l2271_c3_9a48] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2271_c3_9a48_uxn_opcodes_h_l2271_c3_9a48_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2271_c3_9a48_uxn_opcodes_h_l2271_c3_9a48_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2303_c11_af33_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2303_c26_bebb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue := VAR_MUX_uxn_opcodes_h_l2305_c32_6459_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2313_c7_6e5f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2307_c7_b3a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_3c28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_3c28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;

     -- n16_MUX[uxn_opcodes_h_l2298_c7_62c0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond;
     n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue;
     n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output := n16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2307_c7_b3a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2283_c7_5a28] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond <= VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond;
     t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue;
     t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output := t16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;

     -- MUX[uxn_opcodes_h_l2303_c11_af33] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2303_c11_af33_cond <= VAR_MUX_uxn_opcodes_h_l2303_c11_af33_cond;
     MUX_uxn_opcodes_h_l2303_c11_af33_iftrue <= VAR_MUX_uxn_opcodes_h_l2303_c11_af33_iftrue;
     MUX_uxn_opcodes_h_l2303_c11_af33_iffalse <= VAR_MUX_uxn_opcodes_h_l2303_c11_af33_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2303_c11_af33_return_output := MUX_uxn_opcodes_h_l2303_c11_af33_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_62c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2307_c7_b3a4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue := VAR_MUX_uxn_opcodes_h_l2303_c11_af33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2307_c7_b3a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_62c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_3c28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_3c28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_62c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2278_c7_d677] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2278_c7_d677_cond <= VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_cond;
     t16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue;
     t16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output := t16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2301_c7_3c28] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output := result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;

     -- n16_MUX[uxn_opcodes_h_l2293_c7_8a73] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond <= VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond;
     n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue;
     n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output := n16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2301_c7_3c28] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_cond;
     tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output := tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2293_c7_8a73] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2301_c7_3c28_return_output;
     -- n16_MUX[uxn_opcodes_h_l2290_c7_adbe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond;
     n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue;
     n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output := n16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2298_c7_62c0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_62c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2290_c7_adbe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;

     -- t16_MUX[uxn_opcodes_h_l2275_c7_23c6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond;
     t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue;
     t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output := t16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_62c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2293_c7_8a73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2298_c7_62c0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_cond;
     tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output := tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2293_c7_8a73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2298_c7_62c0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2286_c7_ac06] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;

     -- t16_MUX[uxn_opcodes_h_l2270_c2_908b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2270_c2_908b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_cond;
     t16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue;
     t16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output := t16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2293_c7_8a73] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_cond;
     tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output := tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2290_c7_adbe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2293_c7_8a73] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2293_c7_8a73] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output := result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2290_c7_adbe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2293_c7_8a73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;

     -- n16_MUX[uxn_opcodes_h_l2286_c7_ac06] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond <= VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond;
     n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue;
     n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output := n16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2293_c7_8a73_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2290_c7_adbe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_cond;
     tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output := tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2283_c7_5a28] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2286_c7_ac06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2290_c7_adbe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output := result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2290_c7_adbe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;

     -- n16_MUX[uxn_opcodes_h_l2283_c7_5a28] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond <= VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond;
     n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue;
     n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output := n16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2290_c7_adbe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2286_c7_ac06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2290_c7_adbe_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2286_c7_ac06] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_cond;
     tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output := tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2283_c7_5a28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2286_c7_ac06] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output := result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2286_c7_ac06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2286_c7_ac06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2278_c7_d677] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;

     -- n16_MUX[uxn_opcodes_h_l2278_c7_d677] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2278_c7_d677_cond <= VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_cond;
     n16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue;
     n16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output := n16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2283_c7_5a28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2286_c7_ac06_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2283_c7_5a28] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_cond;
     tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output := tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2283_c7_5a28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2278_c7_d677] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2283_c7_5a28] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output := result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;

     -- n16_MUX[uxn_opcodes_h_l2275_c7_23c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond;
     n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue;
     n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output := n16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2278_c7_d677] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2275_c7_23c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2283_c7_5a28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2283_c7_5a28_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2275_c7_23c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2278_c7_d677] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2278_c7_d677] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_cond;
     tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output := tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2278_c7_d677] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;

     -- n16_MUX[uxn_opcodes_h_l2270_c2_908b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2270_c2_908b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_cond;
     n16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue;
     n16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output := n16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2278_c7_d677] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_return_output := result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2270_c2_908b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2275_c7_23c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2278_c7_d677_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2270_c2_908b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2275_c7_23c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_cond;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output := tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2270_c2_908b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2275_c7_23c6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2275_c7_23c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2275_c7_23c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2275_c7_23c6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2270_c2_908b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2270_c2_908b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2270_c2_908b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_cond;
     tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output := tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2270_c2_908b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;

     -- Submodule level 13
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2270_c2_908b_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2322_l2266_DUPLICATE_6f68 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2322_l2266_DUPLICATE_6f68_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2270_c2_908b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2270_c2_908b_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2322_l2266_DUPLICATE_6f68_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2322_l2266_DUPLICATE_6f68_return_output;
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
