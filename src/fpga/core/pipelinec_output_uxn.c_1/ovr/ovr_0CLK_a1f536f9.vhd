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
-- Submodules: 61
entity ovr_0CLK_a1f536f9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_a1f536f9;
architecture arch of ovr_0CLK_a1f536f9 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l301_c6_5239]
signal BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l301_c1_805b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l301_c2_82b9]
signal n8_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l301_c2_82b9]
signal t8_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l301_c2_82b9]
signal result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l301_c2_82b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l301_c2_82b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l301_c2_82b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l301_c2_82b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l301_c2_82b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l302_c3_e1e7[uxn_opcodes_h_l302_c3_e1e7]
signal printf_uxn_opcodes_h_l302_c3_e1e7_uxn_opcodes_h_l302_c3_e1e7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l306_c11_5d9e]
signal BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l306_c7_5377]
signal n8_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l306_c7_5377]
signal t8_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l306_c7_5377]
signal result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l306_c7_5377]
signal result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l306_c7_5377]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l306_c7_5377]
signal result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l306_c7_5377]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l306_c7_5377]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l309_c11_6982]
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l309_c7_079d]
signal n8_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l309_c7_079d]
signal t8_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l309_c7_079d]
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_079d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l309_c7_079d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_079d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l309_c7_079d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_079d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l313_c11_7022]
signal BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l313_c7_d0b9]
signal n8_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l313_c7_d0b9]
signal result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l313_c7_d0b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l313_c7_d0b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l313_c7_d0b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l313_c7_d0b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l313_c7_d0b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l316_c11_a33a]
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l316_c7_3acb]
signal n8_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l316_c7_3acb]
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l316_c7_3acb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l316_c7_3acb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l316_c7_3acb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l316_c7_3acb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l316_c7_3acb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l319_c30_8448]
signal sp_relative_shift_uxn_opcodes_h_l319_c30_8448_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l319_c30_8448_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l319_c30_8448_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l319_c30_8448_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l324_c11_9dfa]
signal BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l324_c7_6775]
signal result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l324_c7_6775]
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l324_c7_6775]
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l324_c7_6775]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l324_c7_6775]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l329_c11_9fd6]
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_0f86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l329_c7_0f86]
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_0f86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_0f86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l333_c11_54c0]
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_2515]
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_2515]
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239
BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_left,
BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_right,
BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_return_output);

-- n8_MUX_uxn_opcodes_h_l301_c2_82b9
n8_MUX_uxn_opcodes_h_l301_c2_82b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l301_c2_82b9_cond,
n8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue,
n8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse,
n8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output);

-- t8_MUX_uxn_opcodes_h_l301_c2_82b9
t8_MUX_uxn_opcodes_h_l301_c2_82b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l301_c2_82b9_cond,
t8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue,
t8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse,
t8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9
result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_cond,
result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9
result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9
result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9
result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_return_output);

-- printf_uxn_opcodes_h_l302_c3_e1e7_uxn_opcodes_h_l302_c3_e1e7
printf_uxn_opcodes_h_l302_c3_e1e7_uxn_opcodes_h_l302_c3_e1e7 : entity work.printf_uxn_opcodes_h_l302_c3_e1e7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l302_c3_e1e7_uxn_opcodes_h_l302_c3_e1e7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e
BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_left,
BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_right,
BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output);

-- n8_MUX_uxn_opcodes_h_l306_c7_5377
n8_MUX_uxn_opcodes_h_l306_c7_5377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l306_c7_5377_cond,
n8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue,
n8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse,
n8_MUX_uxn_opcodes_h_l306_c7_5377_return_output);

-- t8_MUX_uxn_opcodes_h_l306_c7_5377
t8_MUX_uxn_opcodes_h_l306_c7_5377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l306_c7_5377_cond,
t8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue,
t8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse,
t8_MUX_uxn_opcodes_h_l306_c7_5377_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377
result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_cond,
result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377
result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377
result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377
result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377
result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982
BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_left,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_right,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output);

-- n8_MUX_uxn_opcodes_h_l309_c7_079d
n8_MUX_uxn_opcodes_h_l309_c7_079d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l309_c7_079d_cond,
n8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue,
n8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse,
n8_MUX_uxn_opcodes_h_l309_c7_079d_return_output);

-- t8_MUX_uxn_opcodes_h_l309_c7_079d
t8_MUX_uxn_opcodes_h_l309_c7_079d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l309_c7_079d_cond,
t8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue,
t8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse,
t8_MUX_uxn_opcodes_h_l309_c7_079d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d
result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_cond,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022
BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_left,
BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_right,
BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output);

-- n8_MUX_uxn_opcodes_h_l313_c7_d0b9
n8_MUX_uxn_opcodes_h_l313_c7_d0b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l313_c7_d0b9_cond,
n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue,
n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse,
n8_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9
result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_cond,
result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a
BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_left,
BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_right,
BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output);

-- n8_MUX_uxn_opcodes_h_l316_c7_3acb
n8_MUX_uxn_opcodes_h_l316_c7_3acb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l316_c7_3acb_cond,
n8_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue,
n8_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse,
n8_MUX_uxn_opcodes_h_l316_c7_3acb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb
result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_cond,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l319_c30_8448
sp_relative_shift_uxn_opcodes_h_l319_c30_8448 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l319_c30_8448_ins,
sp_relative_shift_uxn_opcodes_h_l319_c30_8448_x,
sp_relative_shift_uxn_opcodes_h_l319_c30_8448_y,
sp_relative_shift_uxn_opcodes_h_l319_c30_8448_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa
BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_left,
BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_right,
BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775
result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_cond,
result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6
BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_left,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_right,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86
result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_cond,
result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0
BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_left,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_right,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_return_output,
 n8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
 t8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output,
 n8_MUX_uxn_opcodes_h_l306_c7_5377_return_output,
 t8_MUX_uxn_opcodes_h_l306_c7_5377_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output,
 n8_MUX_uxn_opcodes_h_l309_c7_079d_return_output,
 t8_MUX_uxn_opcodes_h_l309_c7_079d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output,
 n8_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output,
 n8_MUX_uxn_opcodes_h_l316_c7_3acb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_return_output,
 sp_relative_shift_uxn_opcodes_h_l319_c30_8448_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l303_c3_1149 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l302_c3_e1e7_uxn_opcodes_h_l302_c3_e1e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l307_c3_9375 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l311_c3_7142 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_2a2c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l321_c3_8468 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_4eef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_393c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l329_c7_0f86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_6691_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l316_l313_l309_l306_l301_DUPLICATE_a0f5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_64da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_5658_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l316_l313_l309_l306_l333_l329_l324_DUPLICATE_544e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l338_l297_DUPLICATE_bc91_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_4eef := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_4eef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_393c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_393c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_2a2c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_2a2c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l307_c3_9375 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l307_c3_9375;
     VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l311_c3_7142 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l311_c3_7142;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l321_c3_8468 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l321_c3_8468;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l303_c3_1149 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l303_c3_1149;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse := n8;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l324_c11_9dfa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_left;
     BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_return_output := BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l313_c11_7022] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_left;
     BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output := BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l316_l313_l309_l306_l301_DUPLICATE_a0f5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l316_l313_l309_l306_l301_DUPLICATE_a0f5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l316_c11_a33a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_left;
     BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output := BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_5658 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_5658_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l309_c11_6982] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_left;
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output := BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l329_c11_9fd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_left;
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_return_output := BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l316_l313_l309_l306_l333_l329_l324_DUPLICATE_544e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l316_l313_l309_l306_l333_l329_l324_DUPLICATE_544e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_64da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_64da_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l333_c11_54c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l329_c7_0f86] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l329_c7_0f86_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l306_c11_5d9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_6691 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_6691_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l301_c6_5239] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_left;
     BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output := BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l319_c30_8448] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l319_c30_8448_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_ins;
     sp_relative_shift_uxn_opcodes_h_l319_c30_8448_x <= VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_x;
     sp_relative_shift_uxn_opcodes_h_l319_c30_8448_y <= VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_return_output := sp_relative_shift_uxn_opcodes_h_l319_c30_8448_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_5239_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_5d9e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_6982_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_7022_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_a33a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_9dfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9fd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_54c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l316_l313_l309_l306_l301_DUPLICATE_a0f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l316_l313_l309_l306_l301_DUPLICATE_a0f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l316_l313_l309_l306_l301_DUPLICATE_a0f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l316_l313_l309_l306_l301_DUPLICATE_a0f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l316_l313_l309_l306_l301_DUPLICATE_a0f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l316_l313_l309_l306_l333_l329_l324_DUPLICATE_544e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l316_l313_l309_l306_l333_l329_l324_DUPLICATE_544e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l316_l313_l309_l306_l333_l329_l324_DUPLICATE_544e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l316_l313_l309_l306_l333_l329_l324_DUPLICATE_544e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l316_l313_l309_l306_l333_l329_l324_DUPLICATE_544e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l316_l313_l309_l306_l333_l329_l324_DUPLICATE_544e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l316_l313_l309_l306_l333_l329_l324_DUPLICATE_544e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_5658_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_5658_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_5658_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_5658_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_5658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_64da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_64da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_64da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_64da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_64da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_64da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_64da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_6691_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_6691_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_6691_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_6691_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_6691_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l329_c7_0f86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_8448_return_output;
     -- n8_MUX[uxn_opcodes_h_l316_c7_3acb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l316_c7_3acb_cond <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_cond;
     n8_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue;
     n8_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_return_output := n8_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_2515] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l316_c7_3acb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l324_c7_6775] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l301_c1_805b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_2515] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_return_output;

     -- t8_MUX[uxn_opcodes_h_l309_c7_079d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l309_c7_079d_cond <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_cond;
     t8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue;
     t8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_return_output := t8_MUX_uxn_opcodes_h_l309_c7_079d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l329_c7_0f86] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_cond;
     result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_return_output := result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_0f86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l302_c3_e1e7_uxn_opcodes_h_l302_c3_e1e7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_805b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_2515_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_6775_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_2515_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0f86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0f86_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse := VAR_t8_MUX_uxn_opcodes_h_l309_c7_079d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l313_c7_d0b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l316_c7_3acb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l324_c7_6775] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_cond;
     result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_return_output := result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_0f86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_return_output;

     -- printf_uxn_opcodes_h_l302_c3_e1e7[uxn_opcodes_h_l302_c3_e1e7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l302_c3_e1e7_uxn_opcodes_h_l302_c3_e1e7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l302_c3_e1e7_uxn_opcodes_h_l302_c3_e1e7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l313_c7_d0b9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l313_c7_d0b9_cond <= VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_cond;
     n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue;
     n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output := n8_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;

     -- t8_MUX[uxn_opcodes_h_l306_c7_5377] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l306_c7_5377_cond <= VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_cond;
     t8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue;
     t8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_return_output := t8_MUX_uxn_opcodes_h_l306_c7_5377_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l324_c7_6775] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_0f86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0f86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0f86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_6775_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_6775_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l306_c7_5377_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l316_c7_3acb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_return_output := result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;

     -- t8_MUX[uxn_opcodes_h_l301_c2_82b9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l301_c2_82b9_cond <= VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_cond;
     t8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue;
     t8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output := t8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l324_c7_6775] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l324_c7_6775] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l313_c7_d0b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;

     -- n8_MUX[uxn_opcodes_h_l309_c7_079d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l309_c7_079d_cond <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_cond;
     n8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_iftrue;
     n8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_return_output := n8_MUX_uxn_opcodes_h_l309_c7_079d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l309_c7_079d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l316_c7_3acb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse := VAR_n8_MUX_uxn_opcodes_h_l309_c7_079d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_6775_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_6775_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l313_c7_d0b9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output := result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;

     -- n8_MUX[uxn_opcodes_h_l306_c7_5377] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l306_c7_5377_cond <= VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_cond;
     n8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_iftrue;
     n8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_return_output := n8_MUX_uxn_opcodes_h_l306_c7_5377_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l313_c7_d0b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l309_c7_079d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l306_c7_5377] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l316_c7_3acb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l316_c7_3acb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l306_c7_5377_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_079d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_3acb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l309_c7_079d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_return_output := result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l313_c7_d0b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;

     -- n8_MUX[uxn_opcodes_h_l301_c2_82b9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l301_c2_82b9_cond <= VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_cond;
     n8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue;
     n8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output := n8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l301_c2_82b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l313_c7_d0b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_079d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l306_c7_5377] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l301_c2_82b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_5377_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_d0b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_079d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_079d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_079d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_079d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l306_c7_5377] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l306_c7_5377] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_cond;
     result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_return_output := result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l301_c2_82b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_079d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_079d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_5377_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_5377_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l306_c7_5377] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l301_c2_82b9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_return_output := result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l301_c2_82b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l306_c7_5377] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_5377_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_5377_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l301_c2_82b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l301_c2_82b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l338_l297_DUPLICATE_bc91 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l338_l297_DUPLICATE_bc91_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_25e8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_82b9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_82b9_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l338_l297_DUPLICATE_bc91_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_25e8_uxn_opcodes_h_l338_l297_DUPLICATE_bc91_return_output;
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
