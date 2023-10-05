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
entity sft_0CLK_f7a3ea45 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_f7a3ea45;
architecture arch of sft_0CLK_f7a3ea45 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2094_c6_2881]
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2094_c1_1a1e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2094_c2_4953]
signal n8_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2094_c2_4953]
signal t8_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2094_c2_4953]
signal result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2094_c2_4953]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2094_c2_4953]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2094_c2_4953]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2094_c2_4953]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2094_c2_4953]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2094_c2_4953]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2094_c2_4953]
signal tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2095_c3_1f78[uxn_opcodes_h_l2095_c3_1f78]
signal printf_uxn_opcodes_h_l2095_c3_1f78_uxn_opcodes_h_l2095_c3_1f78_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2100_c11_b74b]
signal BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2100_c7_04c9]
signal n8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2100_c7_04c9]
signal t8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2100_c7_04c9]
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2100_c7_04c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2100_c7_04c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2100_c7_04c9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2100_c7_04c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2100_c7_04c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2100_c7_04c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2100_c7_04c9]
signal tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_84ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2103_c7_d623]
signal n8_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2103_c7_d623]
signal t8_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2103_c7_d623]
signal result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_d623]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2103_c7_d623]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2103_c7_d623]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_d623]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_d623]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_d623]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2103_c7_d623]
signal tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_0ddb]
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2107_c7_010c]
signal n8_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2107_c7_010c]
signal result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_010c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2107_c7_010c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2107_c7_010c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_010c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c7_010c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_010c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2107_c7_010c]
signal tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2110_c11_0afc]
signal BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2110_c7_7986]
signal n8_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2110_c7_7986]
signal result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2110_c7_7986]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2110_c7_7986]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2110_c7_7986]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2110_c7_7986]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2110_c7_7986]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2110_c7_7986]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2110_c7_7986]
signal tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2114_c32_8d4e]
signal BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2114_c32_92c1]
signal BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2114_c32_ffe8]
signal MUX_uxn_opcodes_h_l2114_c32_ffe8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2114_c32_ffe8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2114_c32_ffe8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2114_c32_ffe8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_45ce]
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2116_c7_c1cb]
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_c1cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2116_c7_c1cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_c1cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_c1cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2116_c7_c1cb]
signal tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2117_c18_d30d]
signal BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2117_c11_b463]
signal BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2117_c34_e8c9]
signal CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2117_c11_2be6]
signal BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2123_c11_86bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2123_c7_7c21]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2123_c7_7c21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881
BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_left,
BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_right,
BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_return_output);

-- n8_MUX_uxn_opcodes_h_l2094_c2_4953
n8_MUX_uxn_opcodes_h_l2094_c2_4953 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2094_c2_4953_cond,
n8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue,
n8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse,
n8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output);

-- t8_MUX_uxn_opcodes_h_l2094_c2_4953
t8_MUX_uxn_opcodes_h_l2094_c2_4953 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2094_c2_4953_cond,
t8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue,
t8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse,
t8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953
result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_cond,
result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953
result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953
result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953
result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2094_c2_4953
tmp8_MUX_uxn_opcodes_h_l2094_c2_4953 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_cond,
tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue,
tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse,
tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output);

-- printf_uxn_opcodes_h_l2095_c3_1f78_uxn_opcodes_h_l2095_c3_1f78
printf_uxn_opcodes_h_l2095_c3_1f78_uxn_opcodes_h_l2095_c3_1f78 : entity work.printf_uxn_opcodes_h_l2095_c3_1f78_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2095_c3_1f78_uxn_opcodes_h_l2095_c3_1f78_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b
BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_left,
BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_right,
BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output);

-- n8_MUX_uxn_opcodes_h_l2100_c7_04c9
n8_MUX_uxn_opcodes_h_l2100_c7_04c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond,
n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue,
n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse,
n8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output);

-- t8_MUX_uxn_opcodes_h_l2100_c7_04c9
t8_MUX_uxn_opcodes_h_l2100_c7_04c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond,
t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue,
t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse,
t8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9
result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9
tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond,
tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue,
tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse,
tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output);

-- n8_MUX_uxn_opcodes_h_l2103_c7_d623
n8_MUX_uxn_opcodes_h_l2103_c7_d623 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2103_c7_d623_cond,
n8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue,
n8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse,
n8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output);

-- t8_MUX_uxn_opcodes_h_l2103_c7_d623
t8_MUX_uxn_opcodes_h_l2103_c7_d623 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2103_c7_d623_cond,
t8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue,
t8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse,
t8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623
result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_cond,
result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623
result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623
result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2103_c7_d623
tmp8_MUX_uxn_opcodes_h_l2103_c7_d623 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_cond,
tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue,
tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse,
tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_left,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_right,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output);

-- n8_MUX_uxn_opcodes_h_l2107_c7_010c
n8_MUX_uxn_opcodes_h_l2107_c7_010c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2107_c7_010c_cond,
n8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue,
n8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse,
n8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c
result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c
result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c
result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2107_c7_010c
tmp8_MUX_uxn_opcodes_h_l2107_c7_010c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_cond,
tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue,
tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse,
tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc
BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_left,
BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_right,
BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output);

-- n8_MUX_uxn_opcodes_h_l2110_c7_7986
n8_MUX_uxn_opcodes_h_l2110_c7_7986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2110_c7_7986_cond,
n8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue,
n8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse,
n8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986
result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_cond,
result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986
result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986
result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986
result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986
result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986
result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2110_c7_7986
tmp8_MUX_uxn_opcodes_h_l2110_c7_7986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_cond,
tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue,
tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse,
tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e
BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_left,
BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_right,
BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1
BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_left,
BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_right,
BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_return_output);

-- MUX_uxn_opcodes_h_l2114_c32_ffe8
MUX_uxn_opcodes_h_l2114_c32_ffe8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2114_c32_ffe8_cond,
MUX_uxn_opcodes_h_l2114_c32_ffe8_iftrue,
MUX_uxn_opcodes_h_l2114_c32_ffe8_iffalse,
MUX_uxn_opcodes_h_l2114_c32_ffe8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_left,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_right,
BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb
tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond,
tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue,
tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse,
tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d
BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_left,
BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_right,
BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463
BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463 : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_left,
BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_right,
BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9
CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_x,
CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6
BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6 : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_left,
BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_right,
BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output);



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
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_return_output,
 n8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
 t8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
 tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output,
 n8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output,
 t8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output,
 tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output,
 n8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output,
 t8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_return_output,
 tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output,
 n8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_return_output,
 tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output,
 n8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_return_output,
 tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_return_output,
 MUX_uxn_opcodes_h_l2114_c32_ffe8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output,
 tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_return_output,
 CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2097_c3_32d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2095_c3_1f78_uxn_opcodes_h_l2095_c3_1f78_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_5ae6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_32f3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2108_c3_4d32 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2120_c3_3b36 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2094_DUPLICATE_9aa4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2116_l2107_l2103_l2100_l2094_DUPLICATE_5290_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_DUPLICATE_dcff_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_l2123_DUPLICATE_22cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2103_l2107_l2100_l2110_DUPLICATE_0413_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2123_DUPLICATE_c58d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2110_DUPLICATE_42a1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2128_l2090_DUPLICATE_8e8a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_5ae6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2101_c3_5ae6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2120_c3_3b36 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2120_c3_3b36;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2108_c3_4d32 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2108_c3_4d32;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_32f3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_32f3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2097_c3_32d9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2097_c3_32d9;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse := tmp8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2110_DUPLICATE_42a1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2110_DUPLICATE_42a1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_84ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2123_DUPLICATE_c58d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2123_DUPLICATE_c58d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2110_c11_0afc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2114_c32_8d4e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_left;
     BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_return_output := BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2094_DUPLICATE_9aa4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2094_DUPLICATE_9aa4_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2094_c6_2881] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_left;
     BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output := BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2100_c11_b74b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2116_c11_45ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2117_c18_d30d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_left;
     BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_return_output := BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2103_l2107_l2100_l2110_DUPLICATE_0413 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2103_l2107_l2100_l2110_DUPLICATE_0413_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2123_c11_86bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_0ddb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_l2123_DUPLICATE_22cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_l2123_DUPLICATE_22cf_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_DUPLICATE_dcff LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_DUPLICATE_dcff_return_output := result.sp_relative_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2117_c34_e8c9] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_return_output := CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2116_l2107_l2103_l2100_l2094_DUPLICATE_5290 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2116_l2107_l2103_l2100_l2094_DUPLICATE_5290_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2114_c32_8d4e_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2117_c18_d30d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2094_c6_2881_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2100_c11_b74b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_84ed_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_0ddb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_0afc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2116_c11_45ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_86bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_DUPLICATE_dcff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_DUPLICATE_dcff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_DUPLICATE_dcff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_DUPLICATE_dcff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_DUPLICATE_dcff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2123_DUPLICATE_c58d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2123_DUPLICATE_c58d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2123_DUPLICATE_c58d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2123_DUPLICATE_c58d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2123_DUPLICATE_c58d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2123_DUPLICATE_c58d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2116_l2107_l2103_l2100_l2094_DUPLICATE_5290_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2116_l2107_l2103_l2100_l2094_DUPLICATE_5290_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2116_l2107_l2103_l2100_l2094_DUPLICATE_5290_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2116_l2107_l2103_l2100_l2094_DUPLICATE_5290_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2116_l2107_l2103_l2100_l2094_DUPLICATE_5290_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2103_l2107_l2100_l2110_DUPLICATE_0413_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2103_l2107_l2100_l2110_DUPLICATE_0413_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2103_l2107_l2100_l2110_DUPLICATE_0413_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2103_l2107_l2100_l2110_DUPLICATE_0413_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_l2123_DUPLICATE_22cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_l2123_DUPLICATE_22cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_l2123_DUPLICATE_22cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_l2123_DUPLICATE_22cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_l2123_DUPLICATE_22cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2110_l2107_l2103_l2100_l2094_l2123_DUPLICATE_22cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2110_DUPLICATE_42a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2116_l2110_DUPLICATE_42a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2094_DUPLICATE_9aa4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2094_DUPLICATE_9aa4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2094_DUPLICATE_9aa4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2094_DUPLICATE_9aa4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2094_DUPLICATE_9aa4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2116_l2110_l2107_l2103_l2100_l2094_DUPLICATE_9aa4_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_right := VAR_CONST_SR_4_uxn_opcodes_h_l2117_c34_e8c9_return_output;
     -- n8_MUX[uxn_opcodes_h_l2110_c7_7986] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2110_c7_7986_cond <= VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_cond;
     n8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue;
     n8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output := n8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2094_c1_1a1e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_return_output;

     -- t8_MUX[uxn_opcodes_h_l2103_c7_d623] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2103_c7_d623_cond <= VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_cond;
     t8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue;
     t8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output := t8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2116_c7_c1cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2110_c7_7986] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2123_c7_7c21] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2123_c7_7c21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2114_c32_92c1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_left;
     BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_return_output := BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2116_c7_c1cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2117_c11_b463] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_left;
     BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_return_output := BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2114_c32_92c1_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2117_c11_b463_return_output;
     VAR_printf_uxn_opcodes_h_l2095_c3_1f78_uxn_opcodes_h_l2095_c3_1f78_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2094_c1_1a1e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_7c21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;
     -- MUX[uxn_opcodes_h_l2114_c32_ffe8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2114_c32_ffe8_cond <= VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_cond;
     MUX_uxn_opcodes_h_l2114_c32_ffe8_iftrue <= VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_iftrue;
     MUX_uxn_opcodes_h_l2114_c32_ffe8_iffalse <= VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_return_output := MUX_uxn_opcodes_h_l2114_c32_ffe8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2110_c7_7986] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2110_c7_7986] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;

     -- n8_MUX[uxn_opcodes_h_l2107_c7_010c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2107_c7_010c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_cond;
     n8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue;
     n8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output := n8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2116_c7_c1cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2116_c7_c1cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;

     -- t8_MUX[uxn_opcodes_h_l2100_c7_04c9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond <= VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond;
     t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue;
     t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output := t8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;

     -- printf_uxn_opcodes_h_l2095_c3_1f78[uxn_opcodes_h_l2095_c3_1f78] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2095_c3_1f78_uxn_opcodes_h_l2095_c3_1f78_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2095_c3_1f78_uxn_opcodes_h_l2095_c3_1f78_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_SL[uxn_opcodes_h_l2117_c11_2be6] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_left;
     BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_return_output := BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2107_c7_010c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2117_c11_2be6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue := VAR_MUX_uxn_opcodes_h_l2114_c32_ffe8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_010c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2110_c7_7986] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2110_c7_7986] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2107_c7_010c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2094_c2_4953] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2094_c2_4953_cond <= VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_cond;
     t8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue;
     t8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output := t8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2116_c7_c1cb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2103_c7_d623] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2110_c7_7986] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;

     -- n8_MUX[uxn_opcodes_h_l2103_c7_d623] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2103_c7_d623_cond <= VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_cond;
     n8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue;
     n8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output := n8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2116_c7_c1cb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_cond;
     tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output := tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2116_c7_c1cb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_d623] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2100_c7_04c9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2110_c7_7986] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_cond;
     tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output := tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2110_c7_7986] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_return_output := result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_010c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_010c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2103_c7_d623] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;

     -- n8_MUX[uxn_opcodes_h_l2100_c7_04c9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond;
     n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue;
     n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output := n8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c7_010c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2110_c7_7986_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2107_c7_010c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_cond;
     tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output := tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_d623] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_d623] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2094_c2_4953] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;

     -- n8_MUX[uxn_opcodes_h_l2094_c2_4953] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2094_c2_4953_cond <= VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_cond;
     n8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue;
     n8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output := n8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2100_c7_04c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_d623] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2100_c7_04c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2107_c7_010c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2107_c7_010c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2094_c2_4953] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2100_c7_04c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2094_c2_4953] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2103_c7_d623] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_return_output := result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2103_c7_d623] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_cond;
     tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output := tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2100_c7_04c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2100_c7_04c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2103_c7_d623_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2094_c2_4953] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2100_c7_04c9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_cond;
     tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output := tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2094_c2_4953] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2094_c2_4953] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2100_c7_04c9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2100_c7_04c9_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2094_c2_4953] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_cond;
     tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output := tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2094_c2_4953] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_return_output := result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l2094_c2_4953_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2128_l2090_DUPLICATE_8e8a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2128_l2090_DUPLICATE_8e8a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2094_c2_4953_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2094_c2_4953_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2128_l2090_DUPLICATE_8e8a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2128_l2090_DUPLICATE_8e8a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
