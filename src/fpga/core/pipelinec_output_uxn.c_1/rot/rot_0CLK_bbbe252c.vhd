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
-- Submodules: 89
entity rot_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_bbbe252c;
architecture arch of rot_0CLK_bbbe252c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2887_c6_391c]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_7ea3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2887_c2_7d10]
signal t8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2887_c2_7d10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2887_c2_7d10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2887_c2_7d10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2887_c2_7d10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2887_c2_7d10]
signal result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2887_c2_7d10]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2887_c2_7d10]
signal n8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2887_c2_7d10]
signal l8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2888_c3_61b4[uxn_opcodes_h_l2888_c3_61b4]
signal printf_uxn_opcodes_h_l2888_c3_61b4_uxn_opcodes_h_l2888_c3_61b4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_fdc2]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2892_c7_13be]
signal t8_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2892_c7_13be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2892_c7_13be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2892_c7_13be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2892_c7_13be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2892_c7_13be]
signal result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2892_c7_13be]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2892_c7_13be]
signal n8_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2892_c7_13be]
signal l8_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_f454]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2895_c7_8a36]
signal t8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2895_c7_8a36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2895_c7_8a36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2895_c7_8a36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2895_c7_8a36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2895_c7_8a36]
signal result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2895_c7_8a36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2895_c7_8a36]
signal n8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2895_c7_8a36]
signal l8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_b3a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2899_c7_f733]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2899_c7_f733]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2899_c7_f733]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2899_c7_f733]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2899_c7_f733]
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2899_c7_f733]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2899_c7_f733]
signal n8_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2899_c7_f733]
signal l8_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_8e4b]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2902_c7_ae48]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2902_c7_ae48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2902_c7_ae48]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2902_c7_ae48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2902_c7_ae48]
signal result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2902_c7_ae48]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2902_c7_ae48]
signal n8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2902_c7_ae48]
signal l8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_28a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2906_c7_4fc7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2906_c7_4fc7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2906_c7_4fc7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2906_c7_4fc7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2906_c7_4fc7]
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2906_c7_4fc7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2906_c7_4fc7]
signal l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_d8de]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2909_c7_cbd1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2909_c7_cbd1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2909_c7_cbd1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2909_c7_cbd1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2909_c7_cbd1]
signal result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2909_c7_cbd1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2909_c7_cbd1]
signal l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2912_c32_cece]
signal BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2912_c32_f831]
signal BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2912_c32_58f1]
signal MUX_uxn_opcodes_h_l2912_c32_58f1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2912_c32_58f1_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2912_c32_58f1_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2912_c32_58f1_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_b188]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2914_c7_0302]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2914_c7_0302]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2914_c7_0302]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2914_c7_0302]
signal result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2914_c7_0302]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_9fca]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2920_c7_c453]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2920_c7_c453]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2920_c7_c453]
signal result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2920_c7_c453]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_5ed0]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2924_c7_c551]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2924_c7_c551]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2924_c7_c551]
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2924_c7_c551]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_977b]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2928_c7_fdcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2928_c7_fdcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c
BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_return_output);

-- t8_MUX_uxn_opcodes_h_l2887_c2_7d10
t8_MUX_uxn_opcodes_h_l2887_c2_7d10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond,
t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue,
t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse,
t8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10
result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10
result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_cond,
result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output);

-- n8_MUX_uxn_opcodes_h_l2887_c2_7d10
n8_MUX_uxn_opcodes_h_l2887_c2_7d10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond,
n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue,
n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse,
n8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output);

-- l8_MUX_uxn_opcodes_h_l2887_c2_7d10
l8_MUX_uxn_opcodes_h_l2887_c2_7d10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond,
l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue,
l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse,
l8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output);

-- printf_uxn_opcodes_h_l2888_c3_61b4_uxn_opcodes_h_l2888_c3_61b4
printf_uxn_opcodes_h_l2888_c3_61b4_uxn_opcodes_h_l2888_c3_61b4 : entity work.printf_uxn_opcodes_h_l2888_c3_61b4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2888_c3_61b4_uxn_opcodes_h_l2888_c3_61b4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output);

-- t8_MUX_uxn_opcodes_h_l2892_c7_13be
t8_MUX_uxn_opcodes_h_l2892_c7_13be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2892_c7_13be_cond,
t8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue,
t8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse,
t8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be
result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be
result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be
result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be
result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_cond,
result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be
result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output);

-- n8_MUX_uxn_opcodes_h_l2892_c7_13be
n8_MUX_uxn_opcodes_h_l2892_c7_13be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2892_c7_13be_cond,
n8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue,
n8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse,
n8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output);

-- l8_MUX_uxn_opcodes_h_l2892_c7_13be
l8_MUX_uxn_opcodes_h_l2892_c7_13be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2892_c7_13be_cond,
l8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue,
l8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse,
l8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output);

-- t8_MUX_uxn_opcodes_h_l2895_c7_8a36
t8_MUX_uxn_opcodes_h_l2895_c7_8a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond,
t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue,
t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse,
t8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36
result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36
result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36
result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36
result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_cond,
result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36
result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output);

-- n8_MUX_uxn_opcodes_h_l2895_c7_8a36
n8_MUX_uxn_opcodes_h_l2895_c7_8a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond,
n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue,
n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse,
n8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output);

-- l8_MUX_uxn_opcodes_h_l2895_c7_8a36
l8_MUX_uxn_opcodes_h_l2895_c7_8a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond,
l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue,
l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse,
l8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_cond,
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output);

-- n8_MUX_uxn_opcodes_h_l2899_c7_f733
n8_MUX_uxn_opcodes_h_l2899_c7_f733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2899_c7_f733_cond,
n8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue,
n8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse,
n8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output);

-- l8_MUX_uxn_opcodes_h_l2899_c7_f733
l8_MUX_uxn_opcodes_h_l2899_c7_f733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2899_c7_f733_cond,
l8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue,
l8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse,
l8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48
result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48
result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_cond,
result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48
result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output);

-- n8_MUX_uxn_opcodes_h_l2902_c7_ae48
n8_MUX_uxn_opcodes_h_l2902_c7_ae48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond,
n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue,
n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse,
n8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output);

-- l8_MUX_uxn_opcodes_h_l2902_c7_ae48
l8_MUX_uxn_opcodes_h_l2902_c7_ae48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond,
l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue,
l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse,
l8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output);

-- l8_MUX_uxn_opcodes_h_l2906_c7_4fc7
l8_MUX_uxn_opcodes_h_l2906_c7_4fc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond,
l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue,
l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse,
l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1
result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output);

-- l8_MUX_uxn_opcodes_h_l2909_c7_cbd1
l8_MUX_uxn_opcodes_h_l2909_c7_cbd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond,
l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue,
l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse,
l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece
BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_left,
BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_right,
BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831
BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_left,
BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_right,
BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_return_output);

-- MUX_uxn_opcodes_h_l2912_c32_58f1
MUX_uxn_opcodes_h_l2912_c32_58f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2912_c32_58f1_cond,
MUX_uxn_opcodes_h_l2912_c32_58f1_iftrue,
MUX_uxn_opcodes_h_l2912_c32_58f1_iffalse,
MUX_uxn_opcodes_h_l2912_c32_58f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302
result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_cond,
result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453
result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_cond,
result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_cond,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output);



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
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_return_output,
 t8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
 n8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
 l8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output,
 t8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output,
 n8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output,
 l8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output,
 t8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output,
 n8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output,
 l8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output,
 n8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output,
 l8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output,
 n8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output,
 l8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output,
 l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output,
 l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_return_output,
 MUX_uxn_opcodes_h_l2912_c32_58f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2889_c3_35e8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2888_c3_61b4_uxn_opcodes_h_l2888_c3_61b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2893_c3_2365 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_1e74 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2900_c3_6118 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_a064 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_597c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_aff9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_3734 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_f525 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2895_l2892_l2887_DUPLICATE_3df5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2924_l2895_l2892_l2887_DUPLICATE_00cd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2906_l2902_l2899_l2895_l2892_l2914_l2887_DUPLICATE_302e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2909_l2924_DUPLICATE_c330_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2933_l2883_DUPLICATE_63d8_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_aff9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_aff9;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2900_c3_6118 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2900_c3_6118;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_1e74 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_1e74;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_a064 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_a064;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_3734 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_3734;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_f525 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_f525;
     VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2889_c3_35e8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2889_c3_35e8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2893_c3_2365 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2893_c3_2365;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_597c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2907_c3_597c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_right := to_unsigned(8, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_left := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse := l8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l2912_c32_cece] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_left;
     BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_return_output := BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_b188] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2895_l2892_l2887_DUPLICATE_3df5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2895_l2892_l2887_DUPLICATE_3df5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_f454] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2924_l2895_l2892_l2887_DUPLICATE_00cd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2924_l2895_l2892_l2887_DUPLICATE_00cd_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_8e4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_b3a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2906_l2902_l2899_l2895_l2892_l2914_l2887_DUPLICATE_302e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2906_l2902_l2899_l2895_l2892_l2914_l2887_DUPLICATE_302e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_9fca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_5ed0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_28a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_977b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_d8de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c6_391c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2909_l2924_DUPLICATE_c330 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2909_l2924_DUPLICATE_c330_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_fdc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2912_c32_cece_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c6_391c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_fdc2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_f454_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b3a0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_8e4b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_28a8_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_d8de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_b188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_9fca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_5ed0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_977b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2895_l2892_l2887_DUPLICATE_3df5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2895_l2892_l2887_DUPLICATE_3df5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2895_l2892_l2887_DUPLICATE_3df5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2895_l2892_l2887_DUPLICATE_3df5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2895_l2892_l2887_DUPLICATE_3df5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2895_l2892_l2887_DUPLICATE_3df5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2895_l2892_l2887_DUPLICATE_3df5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2914_DUPLICATE_128e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2906_l2902_l2899_l2895_l2892_l2914_l2887_DUPLICATE_302e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2906_l2902_l2899_l2895_l2892_l2914_l2887_DUPLICATE_302e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2906_l2902_l2899_l2895_l2892_l2914_l2887_DUPLICATE_302e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2906_l2902_l2899_l2895_l2892_l2914_l2887_DUPLICATE_302e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2906_l2902_l2899_l2895_l2892_l2914_l2887_DUPLICATE_302e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2906_l2902_l2899_l2895_l2892_l2914_l2887_DUPLICATE_302e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2906_l2902_l2899_l2895_l2892_l2914_l2887_DUPLICATE_302e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2928_l2899_l2924_l2895_l2920_l2892_l2887_DUPLICATE_d190_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2909_l2924_DUPLICATE_c330_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2909_l2924_DUPLICATE_c330_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2924_l2895_l2892_l2887_DUPLICATE_00cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2924_l2895_l2892_l2887_DUPLICATE_00cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2924_l2895_l2892_l2887_DUPLICATE_00cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2924_l2895_l2892_l2887_DUPLICATE_00cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2924_l2895_l2892_l2887_DUPLICATE_00cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2924_l2895_l2892_l2887_DUPLICATE_00cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2924_l2895_l2892_l2887_DUPLICATE_00cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2909_l2906_l2902_l2899_l2924_l2895_l2892_l2887_DUPLICATE_00cd_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2924_c7_c551] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2928_c7_fdcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2928_c7_fdcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2912_c32_f831] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_left;
     BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_return_output := BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_7ea3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_return_output;

     -- l8_MUX[uxn_opcodes_h_l2909_c7_cbd1] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond <= VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond;
     l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue;
     l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output := l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2902_c7_ae48] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond <= VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond;
     n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue;
     n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output := n8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2914_c7_0302] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2924_c7_c551] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_return_output := result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_return_output;

     -- t8_MUX[uxn_opcodes_h_l2895_c7_8a36] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond <= VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond;
     t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue;
     t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output := t8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2912_c32_f831_return_output;
     VAR_printf_uxn_opcodes_h_l2888_c3_61b4_uxn_opcodes_h_l2888_c3_61b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_7ea3_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_0302_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_fdcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_c551_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_c551_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2920_c7_c453] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2909_c7_cbd1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;

     -- t8_MUX[uxn_opcodes_h_l2892_c7_13be] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2892_c7_13be_cond <= VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_cond;
     t8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue;
     t8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output := t8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;

     -- l8_MUX[uxn_opcodes_h_l2906_c7_4fc7] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond <= VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond;
     l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue;
     l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output := l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2924_c7_c551] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_return_output;

     -- printf_uxn_opcodes_h_l2888_c3_61b4[uxn_opcodes_h_l2888_c3_61b4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2888_c3_61b4_uxn_opcodes_h_l2888_c3_61b4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2888_c3_61b4_uxn_opcodes_h_l2888_c3_61b4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l2899_c7_f733] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2899_c7_f733_cond <= VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_cond;
     n8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue;
     n8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output := n8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;

     -- MUX[uxn_opcodes_h_l2912_c32_58f1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2912_c32_58f1_cond <= VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_cond;
     MUX_uxn_opcodes_h_l2912_c32_58f1_iftrue <= VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_iftrue;
     MUX_uxn_opcodes_h_l2912_c32_58f1_iffalse <= VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_return_output := MUX_uxn_opcodes_h_l2912_c32_58f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2924_c7_c551] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2920_c7_c453] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_return_output := result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue := VAR_MUX_uxn_opcodes_h_l2912_c32_58f1_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_c551_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_c551_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2920_c7_c453_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2920_c7_c453_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2906_c7_4fc7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2914_c7_0302] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_return_output := result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2920_c7_c453] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_return_output;

     -- t8_MUX[uxn_opcodes_h_l2887_c2_7d10] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond <= VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond;
     t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue;
     t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output := t8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2909_c7_cbd1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2895_c7_8a36] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond <= VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond;
     n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue;
     n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output := n8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2914_c7_0302] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2920_c7_c453] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_return_output;

     -- l8_MUX[uxn_opcodes_h_l2902_c7_ae48] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond <= VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_cond;
     l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue;
     l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output := l8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2920_c7_c453_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2920_c7_c453_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_0302_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_0302_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2909_c7_cbd1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2906_c7_4fc7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2892_c7_13be] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2892_c7_13be_cond <= VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_cond;
     n8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue;
     n8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output := n8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2914_c7_0302] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2909_c7_cbd1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2902_c7_ae48] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2914_c7_0302] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_return_output;

     -- l8_MUX[uxn_opcodes_h_l2899_c7_f733] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2899_c7_f733_cond <= VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_cond;
     l8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue;
     l8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output := l8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_0302_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_0302_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2909_c7_cbd1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2887_c2_7d10] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond <= VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond;
     n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue;
     n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output := n8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2906_c7_4fc7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2902_c7_ae48] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;

     -- l8_MUX[uxn_opcodes_h_l2895_c7_8a36] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond <= VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_cond;
     l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue;
     l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output := l8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2906_c7_4fc7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2909_c7_cbd1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2899_c7_f733] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2909_c7_cbd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2899_c7_f733] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;

     -- l8_MUX[uxn_opcodes_h_l2892_c7_13be] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2892_c7_13be_cond <= VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_cond;
     l8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue;
     l8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output := l8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2902_c7_ae48] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output := result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2902_c7_ae48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2906_c7_4fc7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2906_c7_4fc7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2895_c7_8a36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_4fc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;
     -- l8_MUX[uxn_opcodes_h_l2887_c2_7d10] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond <= VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_cond;
     l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue;
     l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output := l8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2899_c7_f733] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_return_output := result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2902_c7_ae48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2895_c7_8a36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2902_c7_ae48] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2892_c7_13be] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2899_c7_f733] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2902_c7_ae48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2895_c7_8a36] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output := result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2895_c7_8a36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2887_c2_7d10] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2899_c7_f733] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2899_c7_f733] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2892_c7_13be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_f733_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2892_c7_13be] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_return_output := result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2895_c7_8a36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2892_c7_13be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2887_c2_7d10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2895_c7_8a36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2895_c7_8a36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2887_c2_7d10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2892_c7_13be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2892_c7_13be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2887_c2_7d10] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output := result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2892_c7_13be_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2887_c2_7d10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2887_c2_7d10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2933_l2883_DUPLICATE_63d8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2933_l2883_DUPLICATE_63d8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c2_7d10_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2933_l2883_DUPLICATE_63d8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2933_l2883_DUPLICATE_63d8_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
