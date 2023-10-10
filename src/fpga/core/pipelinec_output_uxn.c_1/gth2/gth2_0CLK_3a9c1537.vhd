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
entity gth2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_3a9c1537;
architecture arch of gth2_0CLK_3a9c1537 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2071_c6_90fc]
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c1_eeaa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2071_c2_d183]
signal n16_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c2_d183]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2071_c2_d183]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2071_c2_d183]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c2_d183]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c2_d183]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c2_d183]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2071_c2_d183]
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2071_c2_d183]
signal t16_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2072_c3_bffb[uxn_opcodes_h_l2072_c3_bffb]
signal printf_uxn_opcodes_h_l2072_c3_bffb_uxn_opcodes_h_l2072_c3_bffb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2077_c11_aa0c]
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2077_c7_4083]
signal n16_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2077_c7_4083]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2077_c7_4083]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2077_c7_4083]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2077_c7_4083]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2077_c7_4083]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2077_c7_4083]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2077_c7_4083]
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2077_c7_4083]
signal t16_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2080_c11_b3db]
signal BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2080_c7_4d1e]
signal n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2080_c7_4d1e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2080_c7_4d1e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2080_c7_4d1e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2080_c7_4d1e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2080_c7_4d1e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2080_c7_4d1e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2080_c7_4d1e]
signal result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2080_c7_4d1e]
signal t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2085_c11_250e]
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2085_c7_d93a]
signal n16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2085_c7_d93a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2085_c7_d93a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2085_c7_d93a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2085_c7_d93a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2085_c7_d93a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2085_c7_d93a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2085_c7_d93a]
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2085_c7_d93a]
signal t16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2088_c11_34bf]
signal BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2088_c7_b6a2]
signal n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2088_c7_b6a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2088_c7_b6a2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2088_c7_b6a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2088_c7_b6a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2088_c7_b6a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2088_c7_b6a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2088_c7_b6a2]
signal result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2088_c7_b6a2]
signal t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2089_c3_0b90]
signal BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2092_c11_2dfc]
signal BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2092_c7_15ca]
signal n16_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2092_c7_15ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2092_c7_15ca]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2092_c7_15ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2092_c7_15ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2092_c7_15ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2092_c7_15ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2092_c7_15ca]
signal result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2095_c11_aa78]
signal BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2095_c7_65e9]
signal n16_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2095_c7_65e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2095_c7_65e9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2095_c7_65e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2095_c7_65e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2095_c7_65e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2095_c7_65e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2095_c7_65e9]
signal result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2100_c11_230c]
signal BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2100_c7_650a]
signal n16_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2100_c7_650a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2100_c7_650a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2100_c7_650a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2100_c7_650a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2100_c7_650a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2100_c7_650a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2100_c7_650a]
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_f805]
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2103_c7_3fdb]
signal n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2103_c7_3fdb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2103_c7_3fdb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_3fdb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_3fdb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_3fdb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_3fdb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2103_c7_3fdb]
signal result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2104_c3_5190]
signal BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2107_c32_3ef0]
signal BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2107_c32_c204]
signal BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2107_c32_6fd7]
signal MUX_uxn_opcodes_h_l2107_c32_6fd7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2107_c32_6fd7_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2107_c32_6fd7_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2107_c32_6fd7_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2109_c11_1eaf]
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2109_c7_2299]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2109_c7_2299]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2109_c7_2299]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2109_c7_2299]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2109_c7_2299]
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2113_c24_287f]
signal BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2113_c24_3ee1]
signal MUX_uxn_opcodes_h_l2113_c24_3ee1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2113_c24_3ee1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2113_c24_3ee1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2113_c24_3ee1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_68b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_a2cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_a2cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc
BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_left,
BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_right,
BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_return_output);

-- n16_MUX_uxn_opcodes_h_l2071_c2_d183
n16_MUX_uxn_opcodes_h_l2071_c2_d183 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2071_c2_d183_cond,
n16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue,
n16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse,
n16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183
result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183
result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_cond,
result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_return_output);

-- t16_MUX_uxn_opcodes_h_l2071_c2_d183
t16_MUX_uxn_opcodes_h_l2071_c2_d183 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2071_c2_d183_cond,
t16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue,
t16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse,
t16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output);

-- printf_uxn_opcodes_h_l2072_c3_bffb_uxn_opcodes_h_l2072_c3_bffb
printf_uxn_opcodes_h_l2072_c3_bffb_uxn_opcodes_h_l2072_c3_bffb : entity work.printf_uxn_opcodes_h_l2072_c3_bffb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2072_c3_bffb_uxn_opcodes_h_l2072_c3_bffb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_left,
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_right,
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output);

-- n16_MUX_uxn_opcodes_h_l2077_c7_4083
n16_MUX_uxn_opcodes_h_l2077_c7_4083 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2077_c7_4083_cond,
n16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue,
n16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse,
n16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083
result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083
result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083
result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_cond,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_return_output);

-- t16_MUX_uxn_opcodes_h_l2077_c7_4083
t16_MUX_uxn_opcodes_h_l2077_c7_4083 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2077_c7_4083_cond,
t16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue,
t16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse,
t16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_left,
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_right,
BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output);

-- n16_MUX_uxn_opcodes_h_l2080_c7_4d1e
n16_MUX_uxn_opcodes_h_l2080_c7_4d1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond,
n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue,
n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse,
n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e
result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e
result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e
result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e
result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e
result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output);

-- t16_MUX_uxn_opcodes_h_l2080_c7_4d1e
t16_MUX_uxn_opcodes_h_l2080_c7_4d1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond,
t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue,
t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse,
t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e
BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_left,
BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_right,
BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output);

-- n16_MUX_uxn_opcodes_h_l2085_c7_d93a
n16_MUX_uxn_opcodes_h_l2085_c7_d93a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond,
n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue,
n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse,
n16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a
result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a
result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output);

-- t16_MUX_uxn_opcodes_h_l2085_c7_d93a
t16_MUX_uxn_opcodes_h_l2085_c7_d93a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond,
t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue,
t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse,
t16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_left,
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_right,
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output);

-- n16_MUX_uxn_opcodes_h_l2088_c7_b6a2
n16_MUX_uxn_opcodes_h_l2088_c7_b6a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond,
n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue,
n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse,
n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2
result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2
result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2
result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2
result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2
result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output);

-- t16_MUX_uxn_opcodes_h_l2088_c7_b6a2
t16_MUX_uxn_opcodes_h_l2088_c7_b6a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond,
t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue,
t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse,
t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90
BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_left,
BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_right,
BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc
BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_left,
BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_right,
BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output);

-- n16_MUX_uxn_opcodes_h_l2092_c7_15ca
n16_MUX_uxn_opcodes_h_l2092_c7_15ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2092_c7_15ca_cond,
n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue,
n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse,
n16_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca
result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca
result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca
result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca
result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca
result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_cond,
result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78
BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_left,
BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_right,
BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output);

-- n16_MUX_uxn_opcodes_h_l2095_c7_65e9
n16_MUX_uxn_opcodes_h_l2095_c7_65e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2095_c7_65e9_cond,
n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue,
n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse,
n16_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9
result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9
result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9
result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9
result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9
result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c
BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_left,
BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_right,
BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output);

-- n16_MUX_uxn_opcodes_h_l2100_c7_650a
n16_MUX_uxn_opcodes_h_l2100_c7_650a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2100_c7_650a_cond,
n16_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue,
n16_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse,
n16_MUX_uxn_opcodes_h_l2100_c7_650a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a
result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_left,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_right,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output);

-- n16_MUX_uxn_opcodes_h_l2103_c7_3fdb
n16_MUX_uxn_opcodes_h_l2103_c7_3fdb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond,
n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue,
n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse,
n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb
result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb
result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb
result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190
BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_left,
BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_right,
BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0
BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_left,
BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_right,
BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204
BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_left,
BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_right,
BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_return_output);

-- MUX_uxn_opcodes_h_l2107_c32_6fd7
MUX_uxn_opcodes_h_l2107_c32_6fd7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2107_c32_6fd7_cond,
MUX_uxn_opcodes_h_l2107_c32_6fd7_iftrue,
MUX_uxn_opcodes_h_l2107_c32_6fd7_iffalse,
MUX_uxn_opcodes_h_l2107_c32_6fd7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_left,
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_right,
BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_cond,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f
BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_left,
BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_right,
BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_return_output);

-- MUX_uxn_opcodes_h_l2113_c24_3ee1
MUX_uxn_opcodes_h_l2113_c24_3ee1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2113_c24_3ee1_cond,
MUX_uxn_opcodes_h_l2113_c24_3ee1_iftrue,
MUX_uxn_opcodes_h_l2113_c24_3ee1_iffalse,
MUX_uxn_opcodes_h_l2113_c24_3ee1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa
CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_return_output,
 n16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
 t16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output,
 n16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_return_output,
 t16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output,
 n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output,
 t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output,
 n16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output,
 t16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output,
 n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output,
 t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output,
 n16_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output,
 n16_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output,
 n16_MUX_uxn_opcodes_h_l2100_c7_650a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output,
 n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_return_output,
 MUX_uxn_opcodes_h_l2107_c32_6fd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_return_output,
 MUX_uxn_opcodes_h_l2113_c24_3ee1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_52bb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2072_c3_bffb_uxn_opcodes_h_l2072_c3_bffb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2078_c3_da3a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2083_c3_4406 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2086_c3_2e30 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2090_c3_475f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2093_c3_1a6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2098_c3_660d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_1d3a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2112_c3_2697 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_eaec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2089_l2081_l2104_l2096_DUPLICATE_6645_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2103_l2109_DUPLICATE_2366_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2120_l2067_DUPLICATE_13d7_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2078_c3_da3a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2078_c3_da3a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2086_c3_2e30 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2086_c3_2e30;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2083_c3_4406 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2083_c3_4406;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_52bb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_52bb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2112_c3_2697 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2112_c3_2697;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2090_c3_475f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2090_c3_475f;
     VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_1d3a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_1d3a;
     VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2093_c3_1a6a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2093_c3_1a6a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2098_c3_660d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2098_c3_660d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_eaec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_eaec_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output := result.stack_value;

     -- BIN_OP_GT[uxn_opcodes_h_l2113_c24_287f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_left;
     BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_return_output := BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2103_l2109_DUPLICATE_2366 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2103_l2109_DUPLICATE_2366_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l2107_c32_3ef0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_left;
     BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_return_output := BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2100_c11_230c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2092_c11_2dfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2109_c11_1eaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2088_c11_34bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2095_c11_aa78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2089_l2081_l2104_l2096_DUPLICATE_6645 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2089_l2081_l2104_l2096_DUPLICATE_6645_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2080_c11_b3db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_left;
     BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output := BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_68b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_f805] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_left;
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output := BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2085_c11_250e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2077_c11_aa0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2071_c6_90fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2107_c32_3ef0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2071_c6_90fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_aa0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2080_c11_b3db_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2085_c11_250e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_34bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2092_c11_2dfc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2095_c11_aa78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_230c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_f805_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2109_c11_1eaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_68b7_return_output;
     VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2113_c24_287f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2089_l2081_l2104_l2096_DUPLICATE_6645_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2089_l2081_l2104_l2096_DUPLICATE_6645_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2089_l2081_l2104_l2096_DUPLICATE_6645_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_83c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2115_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_19ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2077_l2100_DUPLICATE_f80f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_eaec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_eaec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_eaec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_eaec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_eaec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_eaec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_eaec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2095_l2092_l2088_l2085_l2080_l2103_l2077_l2100_DUPLICATE_eaec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2115_l2085_l2080_l2103_l2077_l2100_DUPLICATE_62f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2103_l2109_DUPLICATE_2366_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2103_l2109_DUPLICATE_2366_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2071_l2095_l2092_l2088_l2085_l2109_l2080_l2103_l2077_l2100_DUPLICATE_051e_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2103_c7_3fdb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2089_c3_0b90] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_left;
     BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_return_output := BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_a2cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output;

     -- MUX[uxn_opcodes_h_l2113_c24_3ee1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2113_c24_3ee1_cond <= VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_cond;
     MUX_uxn_opcodes_h_l2113_c24_3ee1_iftrue <= VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_iftrue;
     MUX_uxn_opcodes_h_l2113_c24_3ee1_iffalse <= VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_return_output := MUX_uxn_opcodes_h_l2113_c24_3ee1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2104_c3_5190] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_left;
     BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_return_output := BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2071_c1_eeaa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_a2cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2107_c32_c204] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_left;
     BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_return_output := BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2109_c7_2299] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2109_c7_2299] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2107_c32_c204_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2089_c3_0b90_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2104_c3_5190_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2097_l2082_DUPLICATE_b3aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue := VAR_MUX_uxn_opcodes_h_l2113_c24_3ee1_return_output;
     VAR_printf_uxn_opcodes_h_l2072_c3_bffb_uxn_opcodes_h_l2072_c3_bffb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2071_c1_eeaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2109_c7_2299_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_a2cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2109_c7_2299_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_3fdb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2109_c7_2299] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2100_c7_650a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2103_c7_3fdb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;

     -- t16_MUX[uxn_opcodes_h_l2088_c7_b6a2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond;
     t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue;
     t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output := t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2109_c7_2299] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_return_output := result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_return_output;

     -- n16_MUX[uxn_opcodes_h_l2103_c7_3fdb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond;
     n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue;
     n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output := n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;

     -- printf_uxn_opcodes_h_l2072_c3_bffb[uxn_opcodes_h_l2072_c3_bffb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2072_c3_bffb_uxn_opcodes_h_l2072_c3_bffb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2072_c3_bffb_uxn_opcodes_h_l2072_c3_bffb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2109_c7_2299] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_return_output;

     -- MUX[uxn_opcodes_h_l2107_c32_6fd7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2107_c32_6fd7_cond <= VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_cond;
     MUX_uxn_opcodes_h_l2107_c32_6fd7_iftrue <= VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_iftrue;
     MUX_uxn_opcodes_h_l2107_c32_6fd7_iffalse <= VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_return_output := MUX_uxn_opcodes_h_l2107_c32_6fd7_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue := VAR_MUX_uxn_opcodes_h_l2107_c32_6fd7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2109_c7_2299_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2109_c7_2299_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2109_c7_2299_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;
     -- t16_MUX[uxn_opcodes_h_l2085_c7_d93a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond;
     t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue;
     t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output := t16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2100_c7_650a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2100_c7_650a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_3fdb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_3fdb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2100_c7_650a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2100_c7_650a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_cond;
     n16_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue;
     n16_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_return_output := n16_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2095_c7_65e9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_3fdb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2103_c7_3fdb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_3fdb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2095_c7_65e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2100_c7_650a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2095_c7_65e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2095_c7_65e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_cond;
     n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue;
     n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output := n16_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2080_c7_4d1e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond;
     t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue;
     t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output := t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2100_c7_650a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2092_c7_15ca] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2100_c7_650a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2100_c7_650a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2095_c7_65e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_650a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2095_c7_65e9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2092_c7_15ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2095_c7_65e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2095_c7_65e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2095_c7_65e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2092_c7_15ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;

     -- n16_MUX[uxn_opcodes_h_l2092_c7_15ca] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2092_c7_15ca_cond <= VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_cond;
     n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue;
     n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output := n16_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2088_c7_b6a2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2077_c7_4083] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2077_c7_4083_cond <= VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_cond;
     t16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue;
     t16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output := t16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2095_c7_65e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;
     -- t16_MUX[uxn_opcodes_h_l2071_c2_d183] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2071_c2_d183_cond <= VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_cond;
     t16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue;
     t16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output := t16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2092_c7_15ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2092_c7_15ca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output := result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2092_c7_15ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2088_c7_b6a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2088_c7_b6a2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond;
     n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue;
     n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output := n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2088_c7_b6a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2092_c7_15ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2085_c7_d93a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2092_c7_15ca_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2085_c7_d93a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2085_c7_d93a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_cond;
     n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue;
     n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output := n16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2088_c7_b6a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2088_c7_b6a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2088_c7_b6a2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2085_c7_d93a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2080_c7_4d1e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2088_c7_b6a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2088_c7_b6a2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2085_c7_d93a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2085_c7_d93a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2080_c7_4d1e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond;
     n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue;
     n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output := n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2085_c7_d93a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2077_c7_4083] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2080_c7_4d1e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2080_c7_4d1e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2085_c7_d93a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2085_c7_d93a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2080_c7_4d1e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2071_c2_d183] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2077_c7_4083] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2080_c7_4d1e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2080_c7_4d1e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2080_c7_4d1e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2077_c7_4083] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2077_c7_4083_cond <= VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_cond;
     n16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue;
     n16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output := n16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2077_c7_4083] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2080_c7_4d1e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2077_c7_4083] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;

     -- n16_MUX[uxn_opcodes_h_l2071_c2_d183] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2071_c2_d183_cond <= VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_cond;
     n16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue;
     n16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output := n16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2077_c7_4083] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_return_output := result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2071_c2_d183] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2077_c7_4083] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2071_c2_d183] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2077_c7_4083] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2071_c2_d183_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_4083_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2071_c2_d183] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_return_output := result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2071_c2_d183] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2071_c2_d183] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2071_c2_d183] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2120_l2067_DUPLICATE_13d7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2120_l2067_DUPLICATE_13d7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2071_c2_d183_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2071_c2_d183_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2120_l2067_DUPLICATE_13d7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2120_l2067_DUPLICATE_13d7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
