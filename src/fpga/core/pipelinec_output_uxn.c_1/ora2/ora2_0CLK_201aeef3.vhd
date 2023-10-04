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
entity ora2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_201aeef3;
architecture arch of ora2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l930_c6_be2b]
signal BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l930_c1_8787]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l930_c2_01e9]
signal tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l930_c2_01e9]
signal t16_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c2_01e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l930_c2_01e9]
signal result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c2_01e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l930_c2_01e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l930_c2_01e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c2_01e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l930_c2_01e9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l930_c2_01e9]
signal n16_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l931_c3_d668[uxn_opcodes_h_l931_c3_d668]
signal printf_uxn_opcodes_h_l931_c3_d668_uxn_opcodes_h_l931_c3_d668_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l936_c11_f8ec]
signal BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l936_c7_dd2e]
signal tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l936_c7_dd2e]
signal t16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l936_c7_dd2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l936_c7_dd2e]
signal result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l936_c7_dd2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l936_c7_dd2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l936_c7_dd2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l936_c7_dd2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l936_c7_dd2e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l936_c7_dd2e]
signal n16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l939_c11_be96]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l939_c7_a1ad]
signal tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l939_c7_a1ad]
signal t16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_a1ad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l939_c7_a1ad]
signal result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c7_a1ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_a1ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_a1ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_a1ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l939_c7_a1ad]
signal result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l939_c7_a1ad]
signal n16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l944_c11_fd6b]
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l944_c7_1ace]
signal tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l944_c7_1ace]
signal t16_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l944_c7_1ace]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l944_c7_1ace]
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l944_c7_1ace]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_1ace]
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_1ace]
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l944_c7_1ace]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l944_c7_1ace]
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l944_c7_1ace]
signal n16_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l947_c11_219b]
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l947_c7_0ba7]
signal tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l947_c7_0ba7]
signal t16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l947_c7_0ba7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l947_c7_0ba7]
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l947_c7_0ba7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l947_c7_0ba7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l947_c7_0ba7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l947_c7_0ba7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l947_c7_0ba7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l947_c7_0ba7]
signal n16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l948_c3_93e1]
signal BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l951_c11_dcbd]
signal BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l951_c7_e30c]
signal tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l951_c7_e30c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l951_c7_e30c]
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l951_c7_e30c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l951_c7_e30c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l951_c7_e30c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l951_c7_e30c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l951_c7_e30c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l951_c7_e30c]
signal n16_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l954_c11_5dcd]
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l954_c7_8bb2]
signal tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l954_c7_8bb2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l954_c7_8bb2]
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l954_c7_8bb2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l954_c7_8bb2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l954_c7_8bb2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l954_c7_8bb2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l954_c7_8bb2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l954_c7_8bb2]
signal n16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l959_c11_9809]
signal BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l959_c7_b9d9]
signal tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l959_c7_b9d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l959_c7_b9d9]
signal result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l959_c7_b9d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l959_c7_b9d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l959_c7_b9d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l959_c7_b9d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l959_c7_b9d9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l959_c7_b9d9]
signal n16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l962_c11_301b]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l962_c7_5df6]
signal tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_5df6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l962_c7_5df6]
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_5df6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_5df6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_5df6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_5df6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_5df6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l962_c7_5df6]
signal n16_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l963_c3_f2c6]
signal BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l964_c11_aae7]
signal BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l967_c32_e580]
signal BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l967_c32_3075]
signal BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l967_c32_2872]
signal MUX_uxn_opcodes_h_l967_c32_2872_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l967_c32_2872_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l967_c32_2872_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l967_c32_2872_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l969_c11_04a9]
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l969_c7_2275]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l969_c7_2275]
signal result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_2275]
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_2275]
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_2275]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l975_c11_c0a7]
signal BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l975_c7_5bf6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l975_c7_5bf6]
signal result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l975_c7_5bf6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l975_c7_5bf6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l977_c34_cd4c]
signal CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l979_c11_052f]
signal BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l979_c7_1396]
signal result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l979_c7_1396]
signal result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b
BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_left,
BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_right,
BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_return_output);

-- tmp16_MUX_uxn_opcodes_h_l930_c2_01e9
tmp16_MUX_uxn_opcodes_h_l930_c2_01e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_cond,
tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue,
tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse,
tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output);

-- t16_MUX_uxn_opcodes_h_l930_c2_01e9
t16_MUX_uxn_opcodes_h_l930_c2_01e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l930_c2_01e9_cond,
t16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue,
t16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse,
t16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9
result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_cond,
result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9
result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9
result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9
result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_return_output);

-- n16_MUX_uxn_opcodes_h_l930_c2_01e9
n16_MUX_uxn_opcodes_h_l930_c2_01e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l930_c2_01e9_cond,
n16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue,
n16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse,
n16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output);

-- printf_uxn_opcodes_h_l931_c3_d668_uxn_opcodes_h_l931_c3_d668
printf_uxn_opcodes_h_l931_c3_d668_uxn_opcodes_h_l931_c3_d668 : entity work.printf_uxn_opcodes_h_l931_c3_d668_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l931_c3_d668_uxn_opcodes_h_l931_c3_d668_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec
BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_left,
BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_right,
BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e
tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond,
tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue,
tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse,
tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output);

-- t16_MUX_uxn_opcodes_h_l936_c7_dd2e
t16_MUX_uxn_opcodes_h_l936_c7_dd2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond,
t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue,
t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse,
t16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e
result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e
result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_cond,
result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e
result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output);

-- n16_MUX_uxn_opcodes_h_l936_c7_dd2e
n16_MUX_uxn_opcodes_h_l936_c7_dd2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond,
n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue,
n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse,
n16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96
BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output);

-- tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad
tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond,
tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue,
tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse,
tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output);

-- t16_MUX_uxn_opcodes_h_l939_c7_a1ad
t16_MUX_uxn_opcodes_h_l939_c7_a1ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond,
t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue,
t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse,
t16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad
result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_cond,
result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad
result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output);

-- n16_MUX_uxn_opcodes_h_l939_c7_a1ad
n16_MUX_uxn_opcodes_h_l939_c7_a1ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond,
n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue,
n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse,
n16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b
BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_left,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_right,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l944_c7_1ace
tmp16_MUX_uxn_opcodes_h_l944_c7_1ace : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_cond,
tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue,
tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse,
tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output);

-- t16_MUX_uxn_opcodes_h_l944_c7_1ace
t16_MUX_uxn_opcodes_h_l944_c7_1ace : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l944_c7_1ace_cond,
t16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue,
t16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse,
t16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace
result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_cond,
result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_return_output);

-- n16_MUX_uxn_opcodes_h_l944_c7_1ace
n16_MUX_uxn_opcodes_h_l944_c7_1ace : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l944_c7_1ace_cond,
n16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue,
n16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse,
n16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b
BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_left,
BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_right,
BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7
tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond,
tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue,
tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse,
tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output);

-- t16_MUX_uxn_opcodes_h_l947_c7_0ba7
t16_MUX_uxn_opcodes_h_l947_c7_0ba7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond,
t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue,
t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse,
t16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7
result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_cond,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output);

-- n16_MUX_uxn_opcodes_h_l947_c7_0ba7
n16_MUX_uxn_opcodes_h_l947_c7_0ba7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond,
n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue,
n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse,
n16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1
BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_left,
BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_right,
BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd
BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_left,
BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_right,
BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l951_c7_e30c
tmp16_MUX_uxn_opcodes_h_l951_c7_e30c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_cond,
tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue,
tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse,
tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c
result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_cond,
result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_return_output);

-- n16_MUX_uxn_opcodes_h_l951_c7_e30c
n16_MUX_uxn_opcodes_h_l951_c7_e30c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l951_c7_e30c_cond,
n16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue,
n16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse,
n16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd
BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_left,
BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_right,
BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2
tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond,
tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue,
tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse,
tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2
result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_cond,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output);

-- n16_MUX_uxn_opcodes_h_l954_c7_8bb2
n16_MUX_uxn_opcodes_h_l954_c7_8bb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond,
n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue,
n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse,
n16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809
BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_left,
BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_right,
BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output);

-- tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9
tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond,
tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9
result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9
result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9
result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output);

-- n16_MUX_uxn_opcodes_h_l959_c7_b9d9
n16_MUX_uxn_opcodes_h_l959_c7_b9d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond,
n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue,
n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse,
n16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b
BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l962_c7_5df6
tmp16_MUX_uxn_opcodes_h_l962_c7_5df6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_cond,
tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue,
tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse,
tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6
result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_cond,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_return_output);

-- n16_MUX_uxn_opcodes_h_l962_c7_5df6
n16_MUX_uxn_opcodes_h_l962_c7_5df6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l962_c7_5df6_cond,
n16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue,
n16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse,
n16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6
BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_left,
BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_right,
BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7
BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_left,
BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_right,
BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l967_c32_e580
BIN_OP_AND_uxn_opcodes_h_l967_c32_e580 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_left,
BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_right,
BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l967_c32_3075
BIN_OP_GT_uxn_opcodes_h_l967_c32_3075 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_left,
BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_right,
BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_return_output);

-- MUX_uxn_opcodes_h_l967_c32_2872
MUX_uxn_opcodes_h_l967_c32_2872 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l967_c32_2872_cond,
MUX_uxn_opcodes_h_l967_c32_2872_iftrue,
MUX_uxn_opcodes_h_l967_c32_2872_iffalse,
MUX_uxn_opcodes_h_l967_c32_2872_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9
BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_left,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_right,
BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275
result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275
result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_cond,
result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7
BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_left,
BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_right,
BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6
result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_cond,
result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c
CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_x,
CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f
BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_left,
BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_right,
BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396
result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396
result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112
CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_return_output,
 tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
 t16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
 n16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output,
 tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output,
 t16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output,
 n16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output,
 tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output,
 t16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output,
 n16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output,
 tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output,
 t16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_return_output,
 n16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output,
 tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output,
 t16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output,
 n16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output,
 tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_return_output,
 n16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output,
 tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output,
 n16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output,
 tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output,
 n16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output,
 tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_return_output,
 n16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_return_output,
 BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_return_output,
 MUX_uxn_opcodes_h_l967_c32_2872_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output,
 CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l933_c3_c4c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l931_c3_d668_uxn_opcodes_h_l931_c3_d668_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l937_c3_2d8c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l942_c3_4c1f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_5548 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_b164 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_4e7a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l957_c3_84d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_0a04 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l967_c32_2872_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l967_c32_2872_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l967_c32_2872_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l967_c32_2872_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_35d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l973_c24_ea4d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_15ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l977_c24_5d9b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_DUPLICATE_86b3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l940_l955_l963_l948_DUPLICATE_78d9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l975_l962_DUPLICATE_d1e9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l984_l926_DUPLICATE_1baa_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l967_c32_2872_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_35d0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_35d0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l937_c3_2d8c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l937_c3_2d8c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l942_c3_4c1f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l942_c3_4c1f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_b164 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_b164;
     VAR_BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_4e7a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l952_c3_4e7a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_5548 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_5548;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l933_c3_c4c0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l933_c3_c4c0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_15ba := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l976_c3_15ba;
     VAR_MUX_uxn_opcodes_h_l967_c32_2872_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_0a04 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l960_c3_0a04;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l957_c3_84d9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l957_c3_84d9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l940_l955_l963_l948_DUPLICATE_78d9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l940_l955_l963_l948_DUPLICATE_78d9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l959_c11_9809] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_left;
     BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output := BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l967_c32_e580] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_left;
     BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_return_output := BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l977_c34_cd4c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_return_output := CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l954_c11_5dcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_left;
     BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output := BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_DUPLICATE_86b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_DUPLICATE_86b3_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l975_l962_DUPLICATE_d1e9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l975_l962_DUPLICATE_d1e9_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l969_c11_04a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l979_c11_052f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_left;
     BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_return_output := BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l930_c6_be2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c11_be96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l951_c11_dcbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l973_c24_ea4d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l973_c24_ea4d_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l975_c11_c0a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l947_c11_219b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_left;
     BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output := BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l944_c11_fd6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l936_c11_f8ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c11_301b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_left := VAR_BIN_OP_AND_uxn_opcodes_h_l967_c32_e580_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l930_c6_be2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l936_c11_f8ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c11_be96_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_fd6b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_219b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l951_c11_dcbd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l954_c11_5dcd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_9809_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_301b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l969_c11_04a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l975_c11_c0a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l979_c11_052f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l940_l955_l963_l948_DUPLICATE_78d9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l940_l955_l963_l948_DUPLICATE_78d9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l940_l955_l963_l948_DUPLICATE_78d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l973_c24_ea4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_fb09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l969_DUPLICATE_6b91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l947_l959_l944_l954_l939_l951_l936_l930_l969_DUPLICATE_d1f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_DUPLICATE_86b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_DUPLICATE_86b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_DUPLICATE_86b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_DUPLICATE_86b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_DUPLICATE_86b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_DUPLICATE_86b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_DUPLICATE_86b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l962_l947_l959_l944_l954_l939_l951_l936_DUPLICATE_86b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l979_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_c0b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l975_l962_DUPLICATE_d1e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l975_l962_DUPLICATE_d1e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l947_l975_l959_l944_l954_l939_l951_l936_l930_DUPLICATE_f932_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l979_c7_1396] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l969_c7_2275] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l963_c3_f2c6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_left;
     BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_return_output := BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l977_c24_5d9b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l977_c24_5d9b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l977_c34_cd4c_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l962_c7_5df6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l967_c32_3075] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_left;
     BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_return_output := BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l948_c3_93e1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_left;
     BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_return_output := BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l930_c1_8787] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l975_c7_5bf6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l979_c7_1396] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l967_c32_2872_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l967_c32_3075_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l948_c3_93e1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_left := VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l963_c3_f2c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l977_c24_5d9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l941_l956_DUPLICATE_1112_return_output;
     VAR_printf_uxn_opcodes_h_l931_c3_d668_uxn_opcodes_h_l931_c3_d668_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l930_c1_8787_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l979_c7_1396_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l969_c7_2275_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l979_c7_1396_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output;
     -- n16_MUX[uxn_opcodes_h_l962_c7_5df6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l962_c7_5df6_cond <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_cond;
     n16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue;
     n16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output := n16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;

     -- t16_MUX[uxn_opcodes_h_l947_c7_0ba7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond <= VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond;
     t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue;
     t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output := t16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l964_c11_aae7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_left;
     BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_return_output := BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l969_c7_2275] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l975_c7_5bf6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output := result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output;

     -- printf_uxn_opcodes_h_l931_c3_d668[uxn_opcodes_h_l931_c3_d668] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l931_c3_d668_uxn_opcodes_h_l931_c3_d668_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l931_c3_d668_uxn_opcodes_h_l931_c3_d668_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l975_c7_5bf6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output;

     -- MUX[uxn_opcodes_h_l967_c32_2872] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l967_c32_2872_cond <= VAR_MUX_uxn_opcodes_h_l967_c32_2872_cond;
     MUX_uxn_opcodes_h_l967_c32_2872_iftrue <= VAR_MUX_uxn_opcodes_h_l967_c32_2872_iftrue;
     MUX_uxn_opcodes_h_l967_c32_2872_iffalse <= VAR_MUX_uxn_opcodes_h_l967_c32_2872_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l967_c32_2872_return_output := MUX_uxn_opcodes_h_l967_c32_2872_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l959_c7_b9d9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c7_5df6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l975_c7_5bf6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l964_c11_aae7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue := VAR_MUX_uxn_opcodes_h_l967_c32_2872_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l969_c7_2275_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l975_c7_5bf6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse := VAR_t16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l954_c7_8bb2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l969_c7_2275] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c7_5df6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c7_5df6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l962_c7_5df6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_cond;
     tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output := tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l969_c7_2275] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l969_c7_2275] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_cond;
     result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_return_output := result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_return_output;

     -- n16_MUX[uxn_opcodes_h_l959_c7_b9d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond;
     n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue;
     n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output := n16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l959_c7_b9d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;

     -- t16_MUX[uxn_opcodes_h_l944_c7_1ace] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l944_c7_1ace_cond <= VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_cond;
     t16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue;
     t16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output := t16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l969_c7_2275_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l969_c7_2275_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l969_c7_2275_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;
     -- t16_MUX[uxn_opcodes_h_l939_c7_a1ad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond <= VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond;
     t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue;
     t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output := t16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_5df6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;

     -- n16_MUX[uxn_opcodes_h_l954_c7_8bb2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond <= VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond;
     n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue;
     n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output := n16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l959_c7_b9d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_cond;
     tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output := tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l954_c7_8bb2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l959_c7_b9d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l962_c7_5df6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_return_output := result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l959_c7_b9d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_5df6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l951_c7_e30c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c7_5df6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l954_c7_8bb2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l947_c7_0ba7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l959_c7_b9d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l954_c7_8bb2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_cond;
     tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output := tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;

     -- t16_MUX[uxn_opcodes_h_l936_c7_dd2e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond <= VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond;
     t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue;
     t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output := t16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l959_c7_b9d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;

     -- n16_MUX[uxn_opcodes_h_l951_c7_e30c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l951_c7_e30c_cond <= VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_cond;
     n16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue;
     n16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output := n16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l954_c7_8bb2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l959_c7_b9d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l951_c7_e30c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l959_c7_b9d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l951_c7_e30c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l951_c7_e30c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_cond;
     tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output := tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l947_c7_0ba7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l954_c7_8bb2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output := result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l954_c7_8bb2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l951_c7_e30c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;

     -- n16_MUX[uxn_opcodes_h_l947_c7_0ba7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond <= VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond;
     n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue;
     n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output := n16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l954_c7_8bb2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;

     -- t16_MUX[uxn_opcodes_h_l930_c2_01e9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l930_c2_01e9_cond <= VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_cond;
     t16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue;
     t16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output := t16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l944_c7_1ace] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse := VAR_n16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l954_c7_8bb2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l951_c7_e30c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l947_c7_0ba7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l951_c7_e30c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l947_c7_0ba7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_cond;
     tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output := tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l947_c7_0ba7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;

     -- n16_MUX[uxn_opcodes_h_l944_c7_1ace] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l944_c7_1ace_cond <= VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_cond;
     n16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue;
     n16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output := n16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l951_c7_e30c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_return_output := result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l939_c7_a1ad] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l944_c7_1ace] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l951_c7_e30c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;
     -- n16_MUX[uxn_opcodes_h_l939_c7_a1ad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond <= VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond;
     n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue;
     n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output := n16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l947_c7_0ba7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l936_c7_dd2e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l947_c7_0ba7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output := result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l939_c7_a1ad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l944_c7_1ace] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l944_c7_1ace] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l947_c7_0ba7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l944_c7_1ace] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_cond;
     tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue;
     tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output := tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_0ba7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l936_c7_dd2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;

     -- n16_MUX[uxn_opcodes_h_l936_c7_dd2e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond <= VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond;
     n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue;
     n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output := n16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_1ace] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l944_c7_1ace] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_cond;
     result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_return_output := result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c7_a1ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c7_a1ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l930_c2_01e9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l939_c7_a1ad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_cond;
     tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output := tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_1ace] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_1ace_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l930_c2_01e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l939_c7_a1ad] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_cond;
     result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output := result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c7_a1ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l936_c7_dd2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l936_c7_dd2e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_cond;
     tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output := tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c7_a1ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;

     -- n16_MUX[uxn_opcodes_h_l930_c2_01e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l930_c2_01e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_cond;
     n16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue;
     n16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output := n16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l936_c7_dd2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l939_c7_a1ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l936_c7_dd2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l936_c7_dd2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l930_c2_01e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l930_c2_01e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l936_c7_dd2e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output := result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l930_c2_01e9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_cond;
     tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output := tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l936_c7_dd2e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l930_c2_01e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l930_c2_01e9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_return_output := result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l930_c2_01e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l984_l926_DUPLICATE_1baa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l984_l926_DUPLICATE_1baa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l930_c2_01e9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l930_c2_01e9_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l984_l926_DUPLICATE_1baa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l984_l926_DUPLICATE_1baa_return_output;
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
