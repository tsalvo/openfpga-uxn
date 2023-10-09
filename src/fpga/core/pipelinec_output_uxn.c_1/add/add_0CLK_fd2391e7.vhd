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
-- Submodules: 64
entity add_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_fd2391e7;
architecture arch of add_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l905_c6_a8bc]
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l905_c1_6257]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l905_c2_a60c]
signal t8_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l905_c2_a60c]
signal n8_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l905_c2_a60c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_a60c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l905_c2_a60c]
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l905_c2_a60c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_a60c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_a60c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_a60c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l906_c3_1fba[uxn_opcodes_h_l906_c3_1fba]
signal printf_uxn_opcodes_h_l906_c3_1fba_uxn_opcodes_h_l906_c3_1fba_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l911_c11_1b4b]
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l911_c7_e639]
signal t8_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l911_c7_e639]
signal n8_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l911_c7_e639]
signal result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l911_c7_e639]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l911_c7_e639]
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l911_c7_e639]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l911_c7_e639]
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l911_c7_e639]
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l911_c7_e639]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l914_c11_27e5]
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l914_c7_b3a3]
signal t8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l914_c7_b3a3]
signal n8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l914_c7_b3a3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_b3a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l914_c7_b3a3]
signal result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_b3a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_b3a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_b3a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_b3a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l918_c11_27b9]
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l918_c7_36d5]
signal n8_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l918_c7_36d5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_36d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l918_c7_36d5]
signal result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l918_c7_36d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_36d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_36d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_36d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l921_c11_a076]
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l921_c7_0205]
signal n8_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l921_c7_0205]
signal result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_0205]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l921_c7_0205]
signal result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l921_c7_0205]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_0205]
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_0205]
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_0205]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l925_c32_82df]
signal BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l925_c32_72c2]
signal BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l925_c32_2fe1]
signal MUX_uxn_opcodes_h_l925_c32_2fe1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l925_c32_2fe1_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l925_c32_2fe1_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l925_c32_2fe1_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l927_c11_c0a1]
signal BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l927_c7_886d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l927_c7_886d]
signal result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l927_c7_886d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l927_c7_886d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l927_c7_886d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l931_c24_a4f1]
signal BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l933_c11_7953]
signal BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l933_c7_2434]
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l933_c7_2434]
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_left,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_right,
BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_return_output);

-- t8_MUX_uxn_opcodes_h_l905_c2_a60c
t8_MUX_uxn_opcodes_h_l905_c2_a60c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l905_c2_a60c_cond,
t8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue,
t8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse,
t8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output);

-- n8_MUX_uxn_opcodes_h_l905_c2_a60c
n8_MUX_uxn_opcodes_h_l905_c2_a60c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l905_c2_a60c_cond,
n8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue,
n8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse,
n8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c
result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_cond,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_return_output);

-- printf_uxn_opcodes_h_l906_c3_1fba_uxn_opcodes_h_l906_c3_1fba
printf_uxn_opcodes_h_l906_c3_1fba_uxn_opcodes_h_l906_c3_1fba : entity work.printf_uxn_opcodes_h_l906_c3_1fba_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l906_c3_1fba_uxn_opcodes_h_l906_c3_1fba_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b
BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_left,
BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_right,
BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output);

-- t8_MUX_uxn_opcodes_h_l911_c7_e639
t8_MUX_uxn_opcodes_h_l911_c7_e639 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l911_c7_e639_cond,
t8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue,
t8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse,
t8_MUX_uxn_opcodes_h_l911_c7_e639_return_output);

-- n8_MUX_uxn_opcodes_h_l911_c7_e639
n8_MUX_uxn_opcodes_h_l911_c7_e639 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l911_c7_e639_cond,
n8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue,
n8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse,
n8_MUX_uxn_opcodes_h_l911_c7_e639_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639
result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639
result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_cond,
result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5
BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_left,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_right,
BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output);

-- t8_MUX_uxn_opcodes_h_l914_c7_b3a3
t8_MUX_uxn_opcodes_h_l914_c7_b3a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond,
t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue,
t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse,
t8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output);

-- n8_MUX_uxn_opcodes_h_l914_c7_b3a3
n8_MUX_uxn_opcodes_h_l914_c7_b3a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond,
n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue,
n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse,
n8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3
result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3
result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9
BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_left,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_right,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output);

-- n8_MUX_uxn_opcodes_h_l918_c7_36d5
n8_MUX_uxn_opcodes_h_l918_c7_36d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l918_c7_36d5_cond,
n8_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue,
n8_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse,
n8_MUX_uxn_opcodes_h_l918_c7_36d5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5
result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5
result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_cond,
result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_left,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_right,
BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output);

-- n8_MUX_uxn_opcodes_h_l921_c7_0205
n8_MUX_uxn_opcodes_h_l921_c7_0205 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l921_c7_0205_cond,
n8_MUX_uxn_opcodes_h_l921_c7_0205_iftrue,
n8_MUX_uxn_opcodes_h_l921_c7_0205_iffalse,
n8_MUX_uxn_opcodes_h_l921_c7_0205_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205
result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205
result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_cond,
result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l925_c32_82df
BIN_OP_AND_uxn_opcodes_h_l925_c32_82df : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_left,
BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_right,
BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2
BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_left,
BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_right,
BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_return_output);

-- MUX_uxn_opcodes_h_l925_c32_2fe1
MUX_uxn_opcodes_h_l925_c32_2fe1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l925_c32_2fe1_cond,
MUX_uxn_opcodes_h_l925_c32_2fe1_iftrue,
MUX_uxn_opcodes_h_l925_c32_2fe1_iffalse,
MUX_uxn_opcodes_h_l925_c32_2fe1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1
BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_left,
BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_right,
BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d
result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d
result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_cond,
result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d
result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d
result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1
BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_left,
BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_right,
BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953
BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_left,
BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_right,
BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_return_output,
 t8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
 n8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output,
 t8_MUX_uxn_opcodes_h_l911_c7_e639_return_output,
 n8_MUX_uxn_opcodes_h_l911_c7_e639_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output,
 t8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output,
 n8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output,
 n8_MUX_uxn_opcodes_h_l918_c7_36d5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output,
 n8_MUX_uxn_opcodes_h_l921_c7_0205_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_return_output,
 BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_return_output,
 BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_return_output,
 MUX_uxn_opcodes_h_l925_c32_2fe1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_2df8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l906_c3_1fba_uxn_opcodes_h_l906_c3_1fba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l912_c3_fe52 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_da43 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_0678 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l931_c3_ed6d : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l930_c3_038e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l921_DUPLICATE_6b8f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_l921_DUPLICATE_10e1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_DUPLICATE_6283_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l911_l905_l933_l921_DUPLICATE_8b96_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l918_l911_l921_l914_DUPLICATE_a6f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l914_l911_l933_l927_l921_DUPLICATE_454a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l927_l921_DUPLICATE_52c0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l938_l901_DUPLICATE_eea1_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_0678 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_0678;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l930_c3_038e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l930_c3_038e;
     VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_2df8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_2df8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l912_c3_fe52 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l912_c3_fe52;
     VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_da43 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l916_c3_da43;
     VAR_BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l914_c11_27e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l927_c11_c0a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l927_l921_DUPLICATE_52c0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l927_l921_DUPLICATE_52c0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l914_l911_l933_l927_l921_DUPLICATE_454a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l914_l911_l933_l927_l921_DUPLICATE_454a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l911_c11_1b4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l921_c11_a076] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_left;
     BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output := BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l931_c24_a4f1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l933_c11_7953] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_left;
     BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_return_output := BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l911_l905_l933_l921_DUPLICATE_8b96 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l911_l905_l933_l921_DUPLICATE_8b96_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_l921_DUPLICATE_10e1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_l921_DUPLICATE_10e1_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l925_c32_82df] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_left;
     BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_return_output := BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l905_c6_a8bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l921_DUPLICATE_6b8f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l921_DUPLICATE_6b8f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l918_l911_l921_l914_DUPLICATE_a6f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l918_l911_l921_l914_DUPLICATE_a6f8_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_DUPLICATE_6283 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_DUPLICATE_6283_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l918_c11_27b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l925_c32_82df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l905_c6_a8bc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l911_c11_1b4b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l914_c11_27e5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_27b9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l921_c11_a076_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l927_c11_c0a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l933_c11_7953_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l931_c3_ed6d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l931_c24_a4f1_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l921_DUPLICATE_6b8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l921_DUPLICATE_6b8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l921_DUPLICATE_6b8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l921_DUPLICATE_6b8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l921_DUPLICATE_6b8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l914_l911_l933_l927_l921_DUPLICATE_454a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l914_l911_l933_l927_l921_DUPLICATE_454a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l914_l911_l933_l927_l921_DUPLICATE_454a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l914_l911_l933_l927_l921_DUPLICATE_454a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l914_l911_l933_l927_l921_DUPLICATE_454a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l918_l914_l911_l933_l927_l921_DUPLICATE_454a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_DUPLICATE_6283_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_DUPLICATE_6283_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_DUPLICATE_6283_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_DUPLICATE_6283_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_DUPLICATE_6283_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l918_l911_l921_l914_DUPLICATE_a6f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l918_l911_l921_l914_DUPLICATE_a6f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l918_l911_l921_l914_DUPLICATE_a6f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l918_l911_l921_l914_DUPLICATE_a6f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l911_l905_l933_l921_DUPLICATE_8b96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l911_l905_l933_l921_DUPLICATE_8b96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l911_l905_l933_l921_DUPLICATE_8b96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l911_l905_l933_l921_DUPLICATE_8b96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l911_l905_l933_l921_DUPLICATE_8b96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l918_l914_l911_l905_l933_l921_DUPLICATE_8b96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l927_l921_DUPLICATE_52c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l927_l921_DUPLICATE_52c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_l921_DUPLICATE_10e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_l921_DUPLICATE_10e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_l921_DUPLICATE_10e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_l921_DUPLICATE_10e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_l921_DUPLICATE_10e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l918_l914_l911_l905_l927_l921_DUPLICATE_10e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iftrue := VAR_result_stack_value_uxn_opcodes_h_l931_c3_ed6d;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l933_c7_2434] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l905_c1_6257] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_return_output;

     -- t8_MUX[uxn_opcodes_h_l914_c7_b3a3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond <= VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond;
     t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue;
     t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output := t8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l925_c32_72c2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_left;
     BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_return_output := BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l927_c7_886d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_return_output := result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l933_c7_2434] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_return_output;

     -- n8_MUX[uxn_opcodes_h_l921_c7_0205] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l921_c7_0205_cond <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_cond;
     n8_MUX_uxn_opcodes_h_l921_c7_0205_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_iftrue;
     n8_MUX_uxn_opcodes_h_l921_c7_0205_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_return_output := n8_MUX_uxn_opcodes_h_l921_c7_0205_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l927_c7_886d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l921_c7_0205] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l927_c7_886d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l925_c32_72c2_return_output;
     VAR_printf_uxn_opcodes_h_l906_c3_1fba_uxn_opcodes_h_l906_c3_1fba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l905_c1_6257_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l921_c7_0205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l933_c7_2434_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l927_c7_886d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l921_c7_0205_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l933_c7_2434_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l927_c7_886d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l927_c7_886d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse := VAR_t8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l927_c7_886d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_return_output;

     -- MUX[uxn_opcodes_h_l925_c32_2fe1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l925_c32_2fe1_cond <= VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_cond;
     MUX_uxn_opcodes_h_l925_c32_2fe1_iftrue <= VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_iftrue;
     MUX_uxn_opcodes_h_l925_c32_2fe1_iffalse <= VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_return_output := MUX_uxn_opcodes_h_l925_c32_2fe1_return_output;

     -- n8_MUX[uxn_opcodes_h_l918_c7_36d5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l918_c7_36d5_cond <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_cond;
     n8_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue;
     n8_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_return_output := n8_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;

     -- printf_uxn_opcodes_h_l906_c3_1fba[uxn_opcodes_h_l906_c3_1fba] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l906_c3_1fba_uxn_opcodes_h_l906_c3_1fba_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l906_c3_1fba_uxn_opcodes_h_l906_c3_1fba_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l921_c7_0205] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output;

     -- t8_MUX[uxn_opcodes_h_l911_c7_e639] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l911_c7_e639_cond <= VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_cond;
     t8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue;
     t8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_return_output := t8_MUX_uxn_opcodes_h_l911_c7_e639_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l918_c7_36d5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l927_c7_886d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l921_c7_0205] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l921_c7_0205] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_cond;
     result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_return_output := result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue := VAR_MUX_uxn_opcodes_h_l925_c32_2fe1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l927_c7_886d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l927_c7_886d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l921_c7_0205_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l921_c7_0205_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l911_c7_e639_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l921_c7_0205] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output;

     -- t8_MUX[uxn_opcodes_h_l905_c2_a60c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l905_c2_a60c_cond <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_cond;
     t8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue;
     t8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output := t8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l918_c7_36d5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_return_output := result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l918_c7_36d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l918_c7_36d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l921_c7_0205] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l921_c7_0205] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l914_c7_b3a3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;

     -- n8_MUX[uxn_opcodes_h_l914_c7_b3a3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond <= VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_cond;
     n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue;
     n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output := n8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse := VAR_n8_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l921_c7_0205_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l921_c7_0205_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l921_c7_0205_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l914_c7_b3a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;

     -- n8_MUX[uxn_opcodes_h_l911_c7_e639] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l911_c7_e639_cond <= VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_cond;
     n8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_iftrue;
     n8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_return_output := n8_MUX_uxn_opcodes_h_l911_c7_e639_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l914_c7_b3a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l911_c7_e639] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_36d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l914_c7_b3a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l918_c7_36d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_36d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l911_c7_e639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l911_c7_e639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l918_c7_36d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l905_c2_a60c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l914_c7_b3a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l914_c7_b3a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l911_c7_e639] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_cond;
     result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_return_output := result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l911_c7_e639] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_return_output;

     -- n8_MUX[uxn_opcodes_h_l905_c2_a60c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l905_c2_a60c_cond <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_cond;
     n8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue;
     n8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output := n8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l914_c7_b3a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l911_c7_e639] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l905_c2_a60c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l914_c7_b3a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l911_c7_e639_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l911_c7_e639_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l905_c2_a60c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_return_output := result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l905_c2_a60c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l911_c7_e639] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l905_c2_a60c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l911_c7_e639] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l911_c7_e639] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l911_c7_e639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l911_c7_e639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l911_c7_e639_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l905_c2_a60c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l905_c2_a60c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l905_c2_a60c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l938_l901_DUPLICATE_eea1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l938_l901_DUPLICATE_eea1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l905_c2_a60c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l905_c2_a60c_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l938_l901_DUPLICATE_eea1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l938_l901_DUPLICATE_eea1_return_output;
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
