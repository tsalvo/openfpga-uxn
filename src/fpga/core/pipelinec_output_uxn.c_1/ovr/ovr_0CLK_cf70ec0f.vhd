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
-- Submodules: 73
entity ovr_0CLK_cf70ec0f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_cf70ec0f;
architecture arch of ovr_0CLK_cf70ec0f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l304_c6_3b5b]
signal BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l304_c1_06e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l304_c2_2f42]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l304_c2_2f42]
signal result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l304_c2_2f42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l304_c2_2f42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l304_c2_2f42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l304_c2_2f42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l304_c2_2f42]
signal result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l304_c2_2f42]
signal t8_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l304_c2_2f42]
signal n8_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l305_c3_2a8b[uxn_opcodes_h_l305_c3_2a8b]
signal printf_uxn_opcodes_h_l305_c3_2a8b_uxn_opcodes_h_l305_c3_2a8b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l310_c11_c8cf]
signal BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l310_c7_61e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l310_c7_61e8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l310_c7_61e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l310_c7_61e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l310_c7_61e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l310_c7_61e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l310_c7_61e8]
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l310_c7_61e8]
signal t8_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l310_c7_61e8]
signal n8_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l313_c11_592b]
signal BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l313_c7_36a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l313_c7_36a4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l313_c7_36a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l313_c7_36a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l313_c7_36a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l313_c7_36a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l313_c7_36a4]
signal result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l313_c7_36a4]
signal t8_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l313_c7_36a4]
signal n8_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l317_c11_f9e6]
signal BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l317_c7_c684]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l317_c7_c684]
signal result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l317_c7_c684]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l317_c7_c684]
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l317_c7_c684]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l317_c7_c684]
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l317_c7_c684]
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l317_c7_c684]
signal n8_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l320_c11_fa28]
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l320_c7_f424]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l320_c7_f424]
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l320_c7_f424]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_f424]
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l320_c7_f424]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_f424]
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l320_c7_f424]
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l320_c7_f424]
signal n8_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l324_c32_6520]
signal BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l324_c32_b751]
signal BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l324_c32_e237]
signal MUX_uxn_opcodes_h_l324_c32_e237_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l324_c32_e237_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l324_c32_e237_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l324_c32_e237_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l326_c11_7991]
signal BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l326_c7_774a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l326_c7_774a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l326_c7_774a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l326_c7_774a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l326_c7_774a]
signal result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l332_c11_604f]
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_170e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_170e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_170e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l332_c7_170e]
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_061c]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_a5c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_a5c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_a5c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l336_c7_a5c7]
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l340_c11_0d37]
signal BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l340_c7_f97a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l340_c7_f97a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b
BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_left,
BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_right,
BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42
result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42
result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_cond,
result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_return_output);

-- t8_MUX_uxn_opcodes_h_l304_c2_2f42
t8_MUX_uxn_opcodes_h_l304_c2_2f42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l304_c2_2f42_cond,
t8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue,
t8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse,
t8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output);

-- n8_MUX_uxn_opcodes_h_l304_c2_2f42
n8_MUX_uxn_opcodes_h_l304_c2_2f42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l304_c2_2f42_cond,
n8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue,
n8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse,
n8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output);

-- printf_uxn_opcodes_h_l305_c3_2a8b_uxn_opcodes_h_l305_c3_2a8b
printf_uxn_opcodes_h_l305_c3_2a8b_uxn_opcodes_h_l305_c3_2a8b : entity work.printf_uxn_opcodes_h_l305_c3_2a8b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l305_c3_2a8b_uxn_opcodes_h_l305_c3_2a8b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf
BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_left,
BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_right,
BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8
result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8
result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_cond,
result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_return_output);

-- t8_MUX_uxn_opcodes_h_l310_c7_61e8
t8_MUX_uxn_opcodes_h_l310_c7_61e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l310_c7_61e8_cond,
t8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue,
t8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse,
t8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output);

-- n8_MUX_uxn_opcodes_h_l310_c7_61e8
n8_MUX_uxn_opcodes_h_l310_c7_61e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l310_c7_61e8_cond,
n8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue,
n8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse,
n8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b
BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_left,
BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_right,
BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4
result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4
result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_cond,
result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_return_output);

-- t8_MUX_uxn_opcodes_h_l313_c7_36a4
t8_MUX_uxn_opcodes_h_l313_c7_36a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l313_c7_36a4_cond,
t8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue,
t8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse,
t8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output);

-- n8_MUX_uxn_opcodes_h_l313_c7_36a4
n8_MUX_uxn_opcodes_h_l313_c7_36a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l313_c7_36a4_cond,
n8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue,
n8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse,
n8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6
BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_left,
BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_right,
BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684
result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684
result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_cond,
result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_return_output);

-- n8_MUX_uxn_opcodes_h_l317_c7_c684
n8_MUX_uxn_opcodes_h_l317_c7_c684 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l317_c7_c684_cond,
n8_MUX_uxn_opcodes_h_l317_c7_c684_iftrue,
n8_MUX_uxn_opcodes_h_l317_c7_c684_iffalse,
n8_MUX_uxn_opcodes_h_l317_c7_c684_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28
BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_left,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_right,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424
result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424
result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424
result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_cond,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_return_output);

-- n8_MUX_uxn_opcodes_h_l320_c7_f424
n8_MUX_uxn_opcodes_h_l320_c7_f424 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l320_c7_f424_cond,
n8_MUX_uxn_opcodes_h_l320_c7_f424_iftrue,
n8_MUX_uxn_opcodes_h_l320_c7_f424_iffalse,
n8_MUX_uxn_opcodes_h_l320_c7_f424_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l324_c32_6520
BIN_OP_AND_uxn_opcodes_h_l324_c32_6520 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_left,
BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_right,
BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l324_c32_b751
BIN_OP_GT_uxn_opcodes_h_l324_c32_b751 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_left,
BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_right,
BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_return_output);

-- MUX_uxn_opcodes_h_l324_c32_e237
MUX_uxn_opcodes_h_l324_c32_e237 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l324_c32_e237_cond,
MUX_uxn_opcodes_h_l324_c32_e237_iftrue,
MUX_uxn_opcodes_h_l324_c32_e237_iffalse,
MUX_uxn_opcodes_h_l324_c32_e237_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991
BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_left,
BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_right,
BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a
result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a
result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a
result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a
result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_cond,
result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f
BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_left,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_right,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e
result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_cond,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c
BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7
result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_cond,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37
BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_left,
BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_right,
BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a
result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a
result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
 t8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
 n8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_return_output,
 t8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output,
 n8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_return_output,
 t8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output,
 n8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_return_output,
 n8_MUX_uxn_opcodes_h_l317_c7_c684_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_return_output,
 n8_MUX_uxn_opcodes_h_l320_c7_f424_return_output,
 BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_return_output,
 BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_return_output,
 MUX_uxn_opcodes_h_l324_c32_e237_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l307_c3_eb2a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l305_c3_2a8b_uxn_opcodes_h_l305_c3_2a8b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l311_c3_61bb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l315_c3_dee4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l318_c3_cf51 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l324_c32_e237_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l324_c32_e237_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l324_c32_e237_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l324_c32_e237_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_a4cc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_1b30 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_1f2d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l326_l310_l304_l317_l313_DUPLICATE_e827_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l320_l310_l304_l317_l313_DUPLICATE_3878_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l320_l336_l310_l340_l304_l317_l313_l332_DUPLICATE_e25b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l320_l336_l310_l304_l317_l313_DUPLICATE_eb32_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l317_l310_l320_l313_DUPLICATE_3692_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l326_l336_l310_l340_l317_l313_l332_DUPLICATE_549e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l336_l320_DUPLICATE_8d3e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l345_l300_DUPLICATE_c204_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l324_c32_e237_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l307_c3_eb2a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l307_c3_eb2a;
     VAR_MUX_uxn_opcodes_h_l324_c32_e237_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l315_c3_dee4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l315_c3_dee4;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_a4cc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l329_c3_a4cc;
     VAR_BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l311_c3_61bb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l311_c3_61bb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_1f2d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_1f2d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_1b30 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_1b30;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l318_c3_cf51 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l318_c3_cf51;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iftrue := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l326_l336_l310_l340_l317_l313_l332_DUPLICATE_549e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l326_l336_l310_l340_l317_l313_l332_DUPLICATE_549e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l313_c11_592b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_left;
     BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output := BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l320_l336_l310_l304_l317_l313_DUPLICATE_eb32 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l320_l336_l310_l304_l317_l313_DUPLICATE_eb32_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l320_l310_l304_l317_l313_DUPLICATE_3878 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l320_l310_l304_l317_l313_DUPLICATE_3878_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_061c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l304_c6_3b5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l324_c32_6520] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_left;
     BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_return_output := BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l340_c11_0d37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_left;
     BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_return_output := BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l320_l336_l310_l340_l304_l317_l313_l332_DUPLICATE_e25b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l320_l336_l310_l340_l304_l317_l313_l332_DUPLICATE_e25b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l320_c11_fa28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_left;
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output := BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l326_l310_l304_l317_l313_DUPLICATE_e827 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l326_l310_l304_l317_l313_DUPLICATE_e827_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l317_l310_l320_l313_DUPLICATE_3692 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l317_l310_l320_l313_DUPLICATE_3692_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l317_c11_f9e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l326_c11_7991] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_left;
     BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_return_output := BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l310_c11_c8cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l336_l320_DUPLICATE_8d3e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l336_l320_DUPLICATE_8d3e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l332_c11_604f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_left;
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_return_output := BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_left := VAR_BIN_OP_AND_uxn_opcodes_h_l324_c32_6520_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l304_c6_3b5b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l310_c11_c8cf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_592b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l317_c11_f9e6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_fa28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_7991_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_604f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_061c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l340_c11_0d37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l320_l310_l304_l317_l313_DUPLICATE_3878_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l320_l310_l304_l317_l313_DUPLICATE_3878_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l320_l310_l304_l317_l313_DUPLICATE_3878_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l320_l310_l304_l317_l313_DUPLICATE_3878_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l320_l310_l304_l317_l313_DUPLICATE_3878_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l326_l336_l310_l340_l317_l313_l332_DUPLICATE_549e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l326_l336_l310_l340_l317_l313_l332_DUPLICATE_549e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l326_l336_l310_l340_l317_l313_l332_DUPLICATE_549e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l326_l336_l310_l340_l317_l313_l332_DUPLICATE_549e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l326_l336_l310_l340_l317_l313_l332_DUPLICATE_549e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l326_l336_l310_l340_l317_l313_l332_DUPLICATE_549e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l326_l336_l310_l340_l317_l313_l332_DUPLICATE_549e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l320_l326_l336_l310_l340_l317_l313_l332_DUPLICATE_549e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l326_l310_l304_l317_l313_DUPLICATE_e827_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l326_l310_l304_l317_l313_DUPLICATE_e827_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l326_l310_l304_l317_l313_DUPLICATE_e827_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l326_l310_l304_l317_l313_DUPLICATE_e827_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l326_l310_l304_l317_l313_DUPLICATE_e827_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l317_l310_l320_l313_DUPLICATE_3692_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l317_l310_l320_l313_DUPLICATE_3692_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l317_l310_l320_l313_DUPLICATE_3692_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l317_l310_l320_l313_DUPLICATE_3692_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l320_l336_l310_l340_l304_l317_l313_l332_DUPLICATE_e25b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l320_l336_l310_l340_l304_l317_l313_l332_DUPLICATE_e25b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l320_l336_l310_l340_l304_l317_l313_l332_DUPLICATE_e25b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l320_l336_l310_l340_l304_l317_l313_l332_DUPLICATE_e25b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l320_l336_l310_l340_l304_l317_l313_l332_DUPLICATE_e25b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l320_l336_l310_l340_l304_l317_l313_l332_DUPLICATE_e25b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l320_l336_l310_l340_l304_l317_l313_l332_DUPLICATE_e25b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l320_l336_l310_l340_l304_l317_l313_l332_DUPLICATE_e25b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l336_l320_DUPLICATE_8d3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l336_l320_DUPLICATE_8d3e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l320_l336_l310_l304_l317_l313_DUPLICATE_eb32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l320_l336_l310_l304_l317_l313_DUPLICATE_eb32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l320_l336_l310_l304_l317_l313_DUPLICATE_eb32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l320_l336_l310_l304_l317_l313_DUPLICATE_eb32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l320_l336_l310_l304_l317_l313_DUPLICATE_eb32_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l320_l336_l310_l304_l317_l313_DUPLICATE_eb32_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l336_c7_a5c7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output := result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l340_c7_f97a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l320_c7_f424] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l304_c1_06e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_a5c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l326_c7_774a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_return_output;

     -- n8_MUX[uxn_opcodes_h_l320_c7_f424] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l320_c7_f424_cond <= VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_cond;
     n8_MUX_uxn_opcodes_h_l320_c7_f424_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_iftrue;
     n8_MUX_uxn_opcodes_h_l320_c7_f424_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_return_output := n8_MUX_uxn_opcodes_h_l320_c7_f424_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l324_c32_b751] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_left;
     BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_return_output := BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l340_c7_f97a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_return_output;

     -- t8_MUX[uxn_opcodes_h_l313_c7_36a4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l313_c7_36a4_cond <= VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_cond;
     t8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue;
     t8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output := t8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l324_c32_e237_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l324_c32_b751_return_output;
     VAR_printf_uxn_opcodes_h_l305_c3_2a8b_uxn_opcodes_h_l305_c3_2a8b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l304_c1_06e6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_iffalse := VAR_n8_MUX_uxn_opcodes_h_l320_c7_f424_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l340_c7_f97a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l326_c7_774a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l320_c7_f424_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l340_c7_f97a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;
     -- MUX[uxn_opcodes_h_l324_c32_e237] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l324_c32_e237_cond <= VAR_MUX_uxn_opcodes_h_l324_c32_e237_cond;
     MUX_uxn_opcodes_h_l324_c32_e237_iftrue <= VAR_MUX_uxn_opcodes_h_l324_c32_e237_iftrue;
     MUX_uxn_opcodes_h_l324_c32_e237_iffalse <= VAR_MUX_uxn_opcodes_h_l324_c32_e237_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l324_c32_e237_return_output := MUX_uxn_opcodes_h_l324_c32_e237_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_a5c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l317_c7_c684] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_return_output;

     -- printf_uxn_opcodes_h_l305_c3_2a8b[uxn_opcodes_h_l305_c3_2a8b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l305_c3_2a8b_uxn_opcodes_h_l305_c3_2a8b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l305_c3_2a8b_uxn_opcodes_h_l305_c3_2a8b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l310_c7_61e8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l310_c7_61e8_cond <= VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_cond;
     t8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue;
     t8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output := t8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_a5c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l332_c7_170e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_return_output := result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l320_c7_f424] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_170e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_return_output;

     -- n8_MUX[uxn_opcodes_h_l317_c7_c684] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l317_c7_c684_cond <= VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_cond;
     n8_MUX_uxn_opcodes_h_l317_c7_c684_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_iftrue;
     n8_MUX_uxn_opcodes_h_l317_c7_c684_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_return_output := n8_MUX_uxn_opcodes_h_l317_c7_c684_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue := VAR_MUX_uxn_opcodes_h_l324_c32_e237_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l317_c7_c684_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l317_c7_c684_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_a5c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_170e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l332_c7_170e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse := VAR_t8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l326_c7_774a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_return_output := result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l317_c7_c684] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_170e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_return_output;

     -- n8_MUX[uxn_opcodes_h_l313_c7_36a4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l313_c7_36a4_cond <= VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_cond;
     n8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue;
     n8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output := n8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_170e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l313_c7_36a4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l326_c7_774a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l320_c7_f424] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output;

     -- t8_MUX[uxn_opcodes_h_l304_c2_2f42] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l304_c2_2f42_cond <= VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_cond;
     t8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue;
     t8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output := t8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_170e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_170e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l320_c7_f424_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_774a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_774a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l320_c7_f424] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_cond;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_return_output := result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l326_c7_774a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l313_c7_36a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l326_c7_774a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l317_c7_c684] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output;

     -- n8_MUX[uxn_opcodes_h_l310_c7_61e8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l310_c7_61e8_cond <= VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_cond;
     n8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue;
     n8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output := n8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l320_c7_f424] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l310_c7_61e8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse := VAR_n8_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_774a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_774a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l317_c7_c684_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_f424_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_f424_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l313_c7_36a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l317_c7_c684] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l317_c7_c684] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_cond;
     result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_return_output := result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l304_c2_2f42] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_f424] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l310_c7_61e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_f424] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_return_output;

     -- n8_MUX[uxn_opcodes_h_l304_c2_2f42] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l304_c2_2f42_cond <= VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_cond;
     n8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue;
     n8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output := n8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l304_c2_2f42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_f424_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_f424_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l317_c7_c684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l317_c7_c684_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l317_c7_c684] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l313_c7_36a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l310_c7_61e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l317_c7_c684] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l304_c2_2f42] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l313_c7_36a4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_return_output := result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l317_c7_c684_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l317_c7_c684_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l304_c2_2f42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l313_c7_36a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l313_c7_36a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l310_c7_61e8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_return_output := result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l310_c7_61e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_36a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l310_c7_61e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l310_c7_61e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l304_c2_2f42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l304_c2_2f42] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_cond;
     result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_return_output := result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l310_c7_61e8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l304_c2_2f42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l304_c2_2f42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l345_l300_DUPLICATE_c204 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l345_l300_DUPLICATE_c204_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l304_c2_2f42_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l304_c2_2f42_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l345_l300_DUPLICATE_c204_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l345_l300_DUPLICATE_c204_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
