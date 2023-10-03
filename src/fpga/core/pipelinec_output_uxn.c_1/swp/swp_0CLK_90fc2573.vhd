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
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
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
-- BIN_OP_EQ[uxn_opcodes_h_l1754_c6_426d]
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1754_c1_8563]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1754_c2_723b]
signal t8_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1754_c2_723b]
signal n8_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1754_c2_723b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c2_723b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c2_723b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c2_723b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1754_c2_723b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c2_723b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1754_c2_723b]
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1755_c3_c3e3[uxn_opcodes_h_l1755_c3_c3e3]
signal printf_uxn_opcodes_h_l1755_c3_c3e3_uxn_opcodes_h_l1755_c3_c3e3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1760_c11_7e4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1760_c7_6caf]
signal t8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1760_c7_6caf]
signal n8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1760_c7_6caf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c7_6caf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c7_6caf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c7_6caf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1760_c7_6caf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c7_6caf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1760_c7_6caf]
signal result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_3590]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1763_c7_1274]
signal t8_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1763_c7_1274]
signal n8_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_1274]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_1274]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_1274]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_1274]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_1274]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_1274]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1763_c7_1274]
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_8f11]
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1767_c7_78ed]
signal n8_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1767_c7_78ed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_78ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_78ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_78ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_78ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_78ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1767_c7_78ed]
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1770_c11_524e]
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1770_c7_3b53]
signal n8_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1770_c7_3b53]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1770_c7_3b53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1770_c7_3b53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1770_c7_3b53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1770_c7_3b53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1770_c7_3b53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1770_c7_3b53]
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1774_c32_7651]
signal BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1774_c32_68f1]
signal BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1774_c32_e846]
signal MUX_uxn_opcodes_h_l1774_c32_e846_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1774_c32_e846_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1774_c32_e846_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1774_c32_e846_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_2766]
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_3175]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_3175]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1776_c7_3175]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_3175]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1776_c7_3175]
signal result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_18fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1782_c7_7ef1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1782_c7_7ef1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_7ef1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1782_c7_7ef1]
signal result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_f36b]
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_bf7f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_bf7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d
BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_left,
BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_right,
BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_return_output);

-- t8_MUX_uxn_opcodes_h_l1754_c2_723b
t8_MUX_uxn_opcodes_h_l1754_c2_723b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1754_c2_723b_cond,
t8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue,
t8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse,
t8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output);

-- n8_MUX_uxn_opcodes_h_l1754_c2_723b
n8_MUX_uxn_opcodes_h_l1754_c2_723b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1754_c2_723b_cond,
n8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue,
n8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse,
n8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b
result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_return_output);

-- printf_uxn_opcodes_h_l1755_c3_c3e3_uxn_opcodes_h_l1755_c3_c3e3
printf_uxn_opcodes_h_l1755_c3_c3e3_uxn_opcodes_h_l1755_c3_c3e3 : entity work.printf_uxn_opcodes_h_l1755_c3_c3e3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1755_c3_c3e3_uxn_opcodes_h_l1755_c3_c3e3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output);

-- t8_MUX_uxn_opcodes_h_l1760_c7_6caf
t8_MUX_uxn_opcodes_h_l1760_c7_6caf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond,
t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue,
t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse,
t8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output);

-- n8_MUX_uxn_opcodes_h_l1760_c7_6caf
n8_MUX_uxn_opcodes_h_l1760_c7_6caf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond,
n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue,
n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse,
n8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf
result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output);

-- t8_MUX_uxn_opcodes_h_l1763_c7_1274
t8_MUX_uxn_opcodes_h_l1763_c7_1274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1763_c7_1274_cond,
t8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue,
t8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse,
t8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output);

-- n8_MUX_uxn_opcodes_h_l1763_c7_1274
n8_MUX_uxn_opcodes_h_l1763_c7_1274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1763_c7_1274_cond,
n8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue,
n8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse,
n8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_cond,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_left,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_right,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output);

-- n8_MUX_uxn_opcodes_h_l1767_c7_78ed
n8_MUX_uxn_opcodes_h_l1767_c7_78ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1767_c7_78ed_cond,
n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue,
n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse,
n8_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_left,
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_right,
BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output);

-- n8_MUX_uxn_opcodes_h_l1770_c7_3b53
n8_MUX_uxn_opcodes_h_l1770_c7_3b53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1770_c7_3b53_cond,
n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue,
n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse,
n8_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53
result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_cond,
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651
BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_left,
BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_right,
BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1
BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_left,
BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_right,
BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_return_output);

-- MUX_uxn_opcodes_h_l1774_c32_e846
MUX_uxn_opcodes_h_l1774_c32_e846 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1774_c32_e846_cond,
MUX_uxn_opcodes_h_l1774_c32_e846_iftrue,
MUX_uxn_opcodes_h_l1774_c32_e846_iffalse,
MUX_uxn_opcodes_h_l1774_c32_e846_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_left,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_right,
BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175
result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175
result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_cond,
result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1
result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1
result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_left,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_right,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_return_output,
 t8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
 n8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output,
 t8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output,
 n8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output,
 t8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output,
 n8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output,
 n8_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output,
 n8_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_return_output,
 MUX_uxn_opcodes_h_l1774_c32_e846_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1757_c3_6111 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1755_c3_c3e3_uxn_opcodes_h_l1755_c3_c3e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_088a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_f683 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1768_c3_8b9e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1774_c32_e846_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1774_c32_e846_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1774_c32_e846_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1774_c32_e846_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1779_c3_0bd6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1783_c3_fe17 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1760_l1754_l1770_l1767_l1763_DUPLICATE_371c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1760_l1786_l1754_l1782_l1770_l1767_l1763_DUPLICATE_3715_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1760_l1754_l1776_l1767_l1763_DUPLICATE_3236_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1760_l1754_l1782_l1770_l1767_l1763_DUPLICATE_e228_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1760_l1770_l1763_l1767_DUPLICATE_467f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1760_l1786_l1782_l1776_l1770_l1767_l1763_DUPLICATE_df7a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1782_l1770_DUPLICATE_48d2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1791_l1750_DUPLICATE_5467_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1783_c3_fe17 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1783_c3_fe17;
     VAR_MUX_uxn_opcodes_h_l1774_c32_e846_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1779_c3_0bd6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1779_c3_0bd6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_f683 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1765_c3_f683;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1774_c32_e846_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1768_c3_8b9e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1768_c3_8b9e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1757_c3_6111 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1757_c3_6111;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_088a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1761_c3_088a;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1760_l1786_l1754_l1782_l1770_l1767_l1763_DUPLICATE_3715 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1760_l1786_l1754_l1782_l1770_l1767_l1763_DUPLICATE_3715_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1760_l1754_l1776_l1767_l1763_DUPLICATE_3236 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1760_l1754_l1776_l1767_l1763_DUPLICATE_3236_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_18fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1760_l1754_l1782_l1770_l1767_l1763_DUPLICATE_e228 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1760_l1754_l1782_l1770_l1767_l1763_DUPLICATE_e228_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1760_l1770_l1763_l1767_DUPLICATE_467f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1760_l1770_l1763_l1767_DUPLICATE_467f_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1776_c11_2766] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_left;
     BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_return_output := BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c11_7e4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1770_c11_524e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1774_c32_7651] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_left;
     BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_return_output := BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1760_l1754_l1770_l1767_l1763_DUPLICATE_371c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1760_l1754_l1770_l1767_l1763_DUPLICATE_371c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_8f11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_left;
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output := BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_f36b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1754_c6_426d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1782_l1770_DUPLICATE_48d2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1782_l1770_DUPLICATE_48d2_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1760_l1786_l1782_l1776_l1770_l1767_l1763_DUPLICATE_df7a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1760_l1786_l1782_l1776_l1770_l1767_l1763_DUPLICATE_df7a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_3590] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1774_c32_7651_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c6_426d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_7e4a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_3590_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_8f11_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1770_c11_524e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1776_c11_2766_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_18fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_f36b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1760_l1754_l1770_l1767_l1763_DUPLICATE_371c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1760_l1754_l1770_l1767_l1763_DUPLICATE_371c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1760_l1754_l1770_l1767_l1763_DUPLICATE_371c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1760_l1754_l1770_l1767_l1763_DUPLICATE_371c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1760_l1754_l1770_l1767_l1763_DUPLICATE_371c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1760_l1786_l1782_l1776_l1770_l1767_l1763_DUPLICATE_df7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1760_l1786_l1782_l1776_l1770_l1767_l1763_DUPLICATE_df7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1760_l1786_l1782_l1776_l1770_l1767_l1763_DUPLICATE_df7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1760_l1786_l1782_l1776_l1770_l1767_l1763_DUPLICATE_df7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1760_l1786_l1782_l1776_l1770_l1767_l1763_DUPLICATE_df7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1760_l1786_l1782_l1776_l1770_l1767_l1763_DUPLICATE_df7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1760_l1786_l1782_l1776_l1770_l1767_l1763_DUPLICATE_df7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1760_l1754_l1776_l1767_l1763_DUPLICATE_3236_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1760_l1754_l1776_l1767_l1763_DUPLICATE_3236_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1760_l1754_l1776_l1767_l1763_DUPLICATE_3236_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1760_l1754_l1776_l1767_l1763_DUPLICATE_3236_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1760_l1754_l1776_l1767_l1763_DUPLICATE_3236_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1760_l1770_l1763_l1767_DUPLICATE_467f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1760_l1770_l1763_l1767_DUPLICATE_467f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1760_l1770_l1763_l1767_DUPLICATE_467f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1760_l1770_l1763_l1767_DUPLICATE_467f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1760_l1786_l1754_l1782_l1770_l1767_l1763_DUPLICATE_3715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1760_l1786_l1754_l1782_l1770_l1767_l1763_DUPLICATE_3715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1760_l1786_l1754_l1782_l1770_l1767_l1763_DUPLICATE_3715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1760_l1786_l1754_l1782_l1770_l1767_l1763_DUPLICATE_3715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1760_l1786_l1754_l1782_l1770_l1767_l1763_DUPLICATE_3715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1760_l1786_l1754_l1782_l1770_l1767_l1763_DUPLICATE_3715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1760_l1786_l1754_l1782_l1770_l1767_l1763_DUPLICATE_3715_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1782_l1770_DUPLICATE_48d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1782_l1770_DUPLICATE_48d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1760_l1754_l1782_l1770_l1767_l1763_DUPLICATE_e228_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1760_l1754_l1782_l1770_l1767_l1763_DUPLICATE_e228_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1760_l1754_l1782_l1770_l1767_l1763_DUPLICATE_e228_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1760_l1754_l1782_l1770_l1767_l1763_DUPLICATE_e228_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1760_l1754_l1782_l1770_l1767_l1763_DUPLICATE_e228_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1760_l1754_l1782_l1770_l1767_l1763_DUPLICATE_e228_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1774_c32_68f1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_left;
     BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_return_output := BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1782_c7_7ef1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1754_c1_8563] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_return_output;

     -- n8_MUX[uxn_opcodes_h_l1770_c7_3b53] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1770_c7_3b53_cond <= VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_cond;
     n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue;
     n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output := n8_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1776_c7_3175] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_bf7f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1782_c7_7ef1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_bf7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1770_c7_3b53] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;

     -- t8_MUX[uxn_opcodes_h_l1763_c7_1274] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1763_c7_1274_cond <= VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_cond;
     t8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue;
     t8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output := t8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1774_c32_e846_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1774_c32_68f1_return_output;
     VAR_printf_uxn_opcodes_h_l1755_c3_c3e3_uxn_opcodes_h_l1755_c3_c3e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1754_c1_8563_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1776_c7_3175_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_bf7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1782_c7_7ef1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output;

     -- printf_uxn_opcodes_h_l1755_c3_c3e3[uxn_opcodes_h_l1755_c3_c3e3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1755_c3_c3e3_uxn_opcodes_h_l1755_c3_c3e3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1755_c3_c3e3_uxn_opcodes_h_l1755_c3_c3e3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1760_c7_6caf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond;
     t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue;
     t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output := t8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;

     -- n8_MUX[uxn_opcodes_h_l1767_c7_78ed] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1767_c7_78ed_cond <= VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_cond;
     n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue;
     n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output := n8_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1776_c7_3175] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1770_c7_3b53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;

     -- MUX[uxn_opcodes_h_l1774_c32_e846] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1774_c32_e846_cond <= VAR_MUX_uxn_opcodes_h_l1774_c32_e846_cond;
     MUX_uxn_opcodes_h_l1774_c32_e846_iftrue <= VAR_MUX_uxn_opcodes_h_l1774_c32_e846_iftrue;
     MUX_uxn_opcodes_h_l1774_c32_e846_iffalse <= VAR_MUX_uxn_opcodes_h_l1774_c32_e846_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1774_c32_e846_return_output := MUX_uxn_opcodes_h_l1774_c32_e846_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1776_c7_3175] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_return_output := result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1767_c7_78ed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_7ef1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue := VAR_MUX_uxn_opcodes_h_l1774_c32_e846_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1782_c7_7ef1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1776_c7_3175_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1776_c7_3175_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1776_c7_3175] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1763_c7_1274] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1770_c7_3b53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1770_c7_3b53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output := result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1770_c7_3b53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;

     -- t8_MUX[uxn_opcodes_h_l1754_c2_723b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1754_c2_723b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_cond;
     t8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue;
     t8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output := t8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1767_c7_78ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;

     -- n8_MUX[uxn_opcodes_h_l1763_c7_1274] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1763_c7_1274_cond <= VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_cond;
     n8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue;
     n8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output := n8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1776_c7_3175] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1776_c7_3175_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1776_c7_3175_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1767_c7_78ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1770_c7_3b53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1760_c7_6caf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1770_c7_3b53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1763_c7_1274] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1767_c7_78ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;

     -- n8_MUX[uxn_opcodes_h_l1760_c7_6caf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond <= VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_cond;
     n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue;
     n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output := n8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1767_c7_78ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1770_c7_3b53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1763_c7_1274] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_return_output := result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_78ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1763_c7_1274] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1760_c7_6caf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_1274] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1754_c2_723b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1754_c2_723b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1754_c2_723b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_cond;
     n8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue;
     n8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output := n8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_78ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1754_c2_723b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_78ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c7_6caf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1754_c2_723b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_1274] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c7_6caf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1760_c7_6caf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_1274] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_1274_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1754_c2_723b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c2_723b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1760_c7_6caf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c7_6caf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1754_c2_723b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1760_c7_6caf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c2_723b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c2_723b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1791_l1750_DUPLICATE_5467 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1791_l1750_DUPLICATE_5467_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c2_723b_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1754_c2_723b_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1791_l1750_DUPLICATE_5467_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1791_l1750_DUPLICATE_5467_return_output;
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
