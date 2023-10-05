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
-- Submodules: 68
entity swp_0CLK_90fc2573 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp_0CLK_90fc2573;
architecture arch of swp_0CLK_90fc2573 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2452_c6_a119]
signal BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2452_c1_21b0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2452_c2_dc3e]
signal n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2452_c2_dc3e]
signal t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2452_c2_dc3e]
signal result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2452_c2_dc3e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2452_c2_dc3e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2452_c2_dc3e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2452_c2_dc3e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2452_c2_dc3e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2452_c2_dc3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2453_c3_61fc[uxn_opcodes_h_l2453_c3_61fc]
signal printf_uxn_opcodes_h_l2453_c3_61fc_uxn_opcodes_h_l2453_c3_61fc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2458_c11_19dd]
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2458_c7_b2e7]
signal n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2458_c7_b2e7]
signal t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2458_c7_b2e7]
signal result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c7_b2e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c7_b2e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2458_c7_b2e7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c7_b2e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2458_c7_b2e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c7_b2e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2461_c11_381e]
signal BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2461_c7_3db0]
signal n8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2461_c7_3db0]
signal t8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2461_c7_3db0]
signal result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2461_c7_3db0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2461_c7_3db0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2461_c7_3db0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2461_c7_3db0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2461_c7_3db0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2461_c7_3db0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2465_c11_e587]
signal BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2465_c7_fff1]
signal n8_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2465_c7_fff1]
signal result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2465_c7_fff1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2465_c7_fff1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2465_c7_fff1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2465_c7_fff1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2465_c7_fff1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2465_c7_fff1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_e315]
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2468_c7_14d7]
signal n8_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2468_c7_14d7]
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2468_c7_14d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_14d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2468_c7_14d7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2468_c7_14d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2468_c7_14d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_14d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2472_c32_141c]
signal BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2472_c32_e540]
signal BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2472_c32_7388]
signal MUX_uxn_opcodes_h_l2472_c32_7388_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2472_c32_7388_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2472_c32_7388_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2472_c32_7388_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2474_c11_75e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2474_c7_ecd7]
signal result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2474_c7_ecd7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2474_c7_ecd7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2474_c7_ecd7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2474_c7_ecd7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2480_c11_a9a3]
signal BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2480_c7_562a]
signal result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2480_c7_562a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2480_c7_562a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2480_c7_562a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2484_c11_6386]
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2484_c7_7a5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c7_7a5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119
BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_left,
BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_right,
BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_return_output);

-- n8_MUX_uxn_opcodes_h_l2452_c2_dc3e
n8_MUX_uxn_opcodes_h_l2452_c2_dc3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond,
n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue,
n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse,
n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output);

-- t8_MUX_uxn_opcodes_h_l2452_c2_dc3e
t8_MUX_uxn_opcodes_h_l2452_c2_dc3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond,
t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue,
t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse,
t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e
result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e
result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e
result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e
result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e
result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output);

-- printf_uxn_opcodes_h_l2453_c3_61fc_uxn_opcodes_h_l2453_c3_61fc
printf_uxn_opcodes_h_l2453_c3_61fc_uxn_opcodes_h_l2453_c3_61fc : entity work.printf_uxn_opcodes_h_l2453_c3_61fc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2453_c3_61fc_uxn_opcodes_h_l2453_c3_61fc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_left,
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_right,
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output);

-- n8_MUX_uxn_opcodes_h_l2458_c7_b2e7
n8_MUX_uxn_opcodes_h_l2458_c7_b2e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond,
n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue,
n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse,
n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output);

-- t8_MUX_uxn_opcodes_h_l2458_c7_b2e7
t8_MUX_uxn_opcodes_h_l2458_c7_b2e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond,
t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue,
t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse,
t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7
result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7
result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e
BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_left,
BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_right,
BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output);

-- n8_MUX_uxn_opcodes_h_l2461_c7_3db0
n8_MUX_uxn_opcodes_h_l2461_c7_3db0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond,
n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue,
n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse,
n8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output);

-- t8_MUX_uxn_opcodes_h_l2461_c7_3db0
t8_MUX_uxn_opcodes_h_l2461_c7_3db0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond,
t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue,
t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse,
t8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0
result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0
result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0
result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0
result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0
result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_left,
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_right,
BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output);

-- n8_MUX_uxn_opcodes_h_l2465_c7_fff1
n8_MUX_uxn_opcodes_h_l2465_c7_fff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2465_c7_fff1_cond,
n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue,
n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse,
n8_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1
result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1
result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1
result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_left,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_right,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output);

-- n8_MUX_uxn_opcodes_h_l2468_c7_14d7
n8_MUX_uxn_opcodes_h_l2468_c7_14d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2468_c7_14d7_cond,
n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue,
n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse,
n8_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7
result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c
BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_left,
BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_right,
BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540
BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_left,
BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_right,
BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_return_output);

-- MUX_uxn_opcodes_h_l2472_c32_7388
MUX_uxn_opcodes_h_l2472_c32_7388 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2472_c32_7388_cond,
MUX_uxn_opcodes_h_l2472_c32_7388_iftrue,
MUX_uxn_opcodes_h_l2472_c32_7388_iffalse,
MUX_uxn_opcodes_h_l2472_c32_7388_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6
BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7
result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7
result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7
result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7
result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3
BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_left,
BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_right,
BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a
result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a
result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a
result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_left,
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_right,
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_return_output,
 n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
 t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output,
 n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output,
 t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output,
 n8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output,
 t8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output,
 n8_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output,
 n8_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_return_output,
 MUX_uxn_opcodes_h_l2472_c32_7388_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_e41d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2453_c3_61fc_uxn_opcodes_h_l2453_c3_61fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2459_c3_0668 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_10d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_8ea8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2472_c32_7388_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2472_c32_7388_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2472_c32_7388_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2472_c32_7388_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2477_c3_dda8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_3439 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_c108_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2452_l2474_l2465_l2461_l2458_DUPLICATE_a0be_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2452_l2468_l2465_l2461_l2458_DUPLICATE_a8b3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_5c5f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2468_l2461_l2465_l2458_DUPLICATE_71c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2480_l2474_l2468_l2465_l2461_l2458_DUPLICATE_e757_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2468_l2480_DUPLICATE_1fc1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2489_l2448_DUPLICATE_4f23_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_10d9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2463_c3_10d9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_3439 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_3439;
     VAR_MUX_uxn_opcodes_h_l2472_c32_7388_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2459_c3_0668 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2459_c3_0668;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2472_c32_7388_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2477_c3_dda8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2477_c3_dda8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_e41d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_e41d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_8ea8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2466_c3_8ea8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_c108 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_c108_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2468_l2461_l2465_l2458_DUPLICATE_71c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2468_l2461_l2465_l2458_DUPLICATE_71c3_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2452_l2468_l2465_l2461_l2458_DUPLICATE_a8b3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2452_l2468_l2465_l2461_l2458_DUPLICATE_a8b3_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2474_c11_75e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_e315] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_left;
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output := BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2465_c11_e587] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_left;
     BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output := BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2480_c11_a9a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_5c5f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_5c5f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2484_c11_6386] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_left;
     BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_return_output := BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2480_l2474_l2468_l2465_l2461_l2458_DUPLICATE_e757 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2480_l2474_l2468_l2465_l2461_l2458_DUPLICATE_e757_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2458_c11_19dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2461_c11_381e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2452_c6_a119] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_left;
     BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output := BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2452_l2474_l2465_l2461_l2458_DUPLICATE_a0be LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2452_l2474_l2465_l2461_l2458_DUPLICATE_a0be_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2472_c32_141c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_left;
     BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_return_output := BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2468_l2480_DUPLICATE_1fc1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2468_l2480_DUPLICATE_1fc1_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2472_c32_141c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2452_c6_a119_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_19dd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2461_c11_381e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2465_c11_e587_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_e315_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2474_c11_75e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2480_c11_a9a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_6386_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2452_l2468_l2465_l2461_l2458_DUPLICATE_a8b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2452_l2468_l2465_l2461_l2458_DUPLICATE_a8b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2452_l2468_l2465_l2461_l2458_DUPLICATE_a8b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2452_l2468_l2465_l2461_l2458_DUPLICATE_a8b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2452_l2468_l2465_l2461_l2458_DUPLICATE_a8b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2480_l2474_l2468_l2465_l2461_l2458_DUPLICATE_e757_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2480_l2474_l2468_l2465_l2461_l2458_DUPLICATE_e757_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2480_l2474_l2468_l2465_l2461_l2458_DUPLICATE_e757_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2480_l2474_l2468_l2465_l2461_l2458_DUPLICATE_e757_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2480_l2474_l2468_l2465_l2461_l2458_DUPLICATE_e757_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2480_l2474_l2468_l2465_l2461_l2458_DUPLICATE_e757_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2484_l2480_l2474_l2468_l2465_l2461_l2458_DUPLICATE_e757_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2452_l2474_l2465_l2461_l2458_DUPLICATE_a0be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2452_l2474_l2465_l2461_l2458_DUPLICATE_a0be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2452_l2474_l2465_l2461_l2458_DUPLICATE_a0be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2452_l2474_l2465_l2461_l2458_DUPLICATE_a0be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2452_l2474_l2465_l2461_l2458_DUPLICATE_a0be_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2468_l2461_l2465_l2458_DUPLICATE_71c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2468_l2461_l2465_l2458_DUPLICATE_71c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2468_l2461_l2465_l2458_DUPLICATE_71c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2468_l2461_l2465_l2458_DUPLICATE_71c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_5c5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_5c5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_5c5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_5c5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_5c5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_5c5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2484_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_5c5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2468_l2480_DUPLICATE_1fc1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2468_l2480_DUPLICATE_1fc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_c108_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_c108_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_c108_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_c108_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_c108_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2452_l2480_l2468_l2465_l2461_l2458_DUPLICATE_c108_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2480_c7_562a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2452_c1_21b0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_return_output;

     -- n8_MUX[uxn_opcodes_h_l2468_c7_14d7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2468_c7_14d7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_cond;
     n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue;
     n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output := n8_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2474_c7_ecd7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2484_c7_7a5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output;

     -- t8_MUX[uxn_opcodes_h_l2461_c7_3db0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond <= VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond;
     t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue;
     t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output := t8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c7_7a5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2480_c7_562a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2468_c7_14d7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2472_c32_e540] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_left;
     BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_return_output := BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2472_c32_7388_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2472_c32_e540_return_output;
     VAR_printf_uxn_opcodes_h_l2453_c3_61fc_uxn_opcodes_h_l2453_c3_61fc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2452_c1_21b0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_7a5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2480_c7_562a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2480_c7_562a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2480_c7_562a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_14d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2474_c7_ecd7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2465_c7_fff1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2465_c7_fff1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2465_c7_fff1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_cond;
     n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue;
     n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output := n8_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;

     -- MUX[uxn_opcodes_h_l2472_c32_7388] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2472_c32_7388_cond <= VAR_MUX_uxn_opcodes_h_l2472_c32_7388_cond;
     MUX_uxn_opcodes_h_l2472_c32_7388_iftrue <= VAR_MUX_uxn_opcodes_h_l2472_c32_7388_iftrue;
     MUX_uxn_opcodes_h_l2472_c32_7388_iffalse <= VAR_MUX_uxn_opcodes_h_l2472_c32_7388_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2472_c32_7388_return_output := MUX_uxn_opcodes_h_l2472_c32_7388_return_output;

     -- printf_uxn_opcodes_h_l2453_c3_61fc[uxn_opcodes_h_l2453_c3_61fc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2453_c3_61fc_uxn_opcodes_h_l2453_c3_61fc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2453_c3_61fc_uxn_opcodes_h_l2453_c3_61fc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l2458_c7_b2e7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond <= VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond;
     t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue;
     t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output := t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2480_c7_562a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2474_c7_ecd7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue := VAR_MUX_uxn_opcodes_h_l2472_c32_7388_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2480_c7_562a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2480_c7_562a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;
     -- t8_MUX[uxn_opcodes_h_l2452_c2_dc3e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond <= VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond;
     t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue;
     t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output := t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2468_c7_14d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2468_c7_14d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2468_c7_14d7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2474_c7_ecd7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2461_c7_3db0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond <= VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_cond;
     n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue;
     n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output := n8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2474_c7_ecd7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2465_c7_fff1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2461_c7_3db0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2474_c7_ecd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2465_c7_fff1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_14d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2468_c7_14d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2465_c7_fff1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2458_c7_b2e7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond;
     n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue;
     n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output := n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2465_c7_fff1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2461_c7_3db0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2458_c7_b2e7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2468_c7_14d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2465_c7_fff1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2452_c2_dc3e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2461_c7_3db0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;

     -- n8_MUX[uxn_opcodes_h_l2452_c2_dc3e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond <= VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond;
     n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue;
     n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output := n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2461_c7_3db0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c7_b2e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2461_c7_3db0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2465_c7_fff1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2465_c7_fff1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2461_c7_3db0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c7_b2e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2461_c7_3db0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2458_c7_b2e7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c7_b2e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2452_c2_dc3e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2461_c7_3db0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2458_c7_b2e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2452_c2_dc3e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c7_b2e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2452_c2_dc3e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2452_c2_dc3e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_b2e7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2452_c2_dc3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2452_c2_dc3e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2489_l2448_DUPLICATE_4f23 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2489_l2448_DUPLICATE_4f23_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2452_c2_dc3e_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2489_l2448_DUPLICATE_4f23_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2489_l2448_DUPLICATE_4f23_return_output;
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
