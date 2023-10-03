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
-- Submodules: 65
entity neq_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq_0CLK_7c2e709f;
architecture arch of neq_0CLK_7c2e709f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l934_c6_490f]
signal BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l934_c1_0e84]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l934_c2_eca7]
signal t8_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l934_c2_eca7]
signal n8_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l934_c2_eca7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l934_c2_eca7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l934_c2_eca7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l934_c2_eca7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l934_c2_eca7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l934_c2_eca7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l934_c2_eca7]
signal result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l935_c3_1d47[uxn_opcodes_h_l935_c3_1d47]
signal printf_uxn_opcodes_h_l935_c3_1d47_uxn_opcodes_h_l935_c3_1d47_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l940_c11_a3aa]
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l940_c7_801b]
signal t8_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l940_c7_801b]
signal n8_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l940_c7_801b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c7_801b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_801b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_801b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l940_c7_801b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_801b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l940_c7_801b]
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l943_c11_c054]
signal BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l943_c7_b26c]
signal t8_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l943_c7_b26c]
signal n8_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l943_c7_b26c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l943_c7_b26c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l943_c7_b26c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l943_c7_b26c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l943_c7_b26c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l943_c7_b26c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l943_c7_b26c]
signal result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l947_c11_cb0e]
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l947_c7_df7e]
signal n8_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l947_c7_df7e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l947_c7_df7e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l947_c7_df7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l947_c7_df7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l947_c7_df7e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l947_c7_df7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l947_c7_df7e]
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l950_c11_e64c]
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l950_c7_e6a3]
signal n8_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l950_c7_e6a3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l950_c7_e6a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l950_c7_e6a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l950_c7_e6a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l950_c7_e6a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l950_c7_e6a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l950_c7_e6a3]
signal result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l954_c32_6b9a]
signal BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l954_c32_10c0]
signal BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l954_c32_fdb4]
signal MUX_uxn_opcodes_h_l954_c32_fdb4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l954_c32_fdb4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l954_c32_fdb4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l954_c32_fdb4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l956_c11_4fcb]
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l956_c7_1b17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l956_c7_1b17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l956_c7_1b17]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c7_1b17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l956_c7_1b17]
signal result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l960_c24_6d7f]
signal BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l960_c24_aa18]
signal MUX_uxn_opcodes_h_l960_c24_aa18_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l960_c24_aa18_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l960_c24_aa18_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l960_c24_aa18_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l962_c11_2e05]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_7f7f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_7f7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f
BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_left,
BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_right,
BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_return_output);

-- t8_MUX_uxn_opcodes_h_l934_c2_eca7
t8_MUX_uxn_opcodes_h_l934_c2_eca7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l934_c2_eca7_cond,
t8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue,
t8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse,
t8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output);

-- n8_MUX_uxn_opcodes_h_l934_c2_eca7
n8_MUX_uxn_opcodes_h_l934_c2_eca7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l934_c2_eca7_cond,
n8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue,
n8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse,
n8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7
result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7
result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7
result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7
result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_cond,
result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_return_output);

-- printf_uxn_opcodes_h_l935_c3_1d47_uxn_opcodes_h_l935_c3_1d47
printf_uxn_opcodes_h_l935_c3_1d47_uxn_opcodes_h_l935_c3_1d47 : entity work.printf_uxn_opcodes_h_l935_c3_1d47_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l935_c3_1d47_uxn_opcodes_h_l935_c3_1d47_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa
BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_left,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_right,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output);

-- t8_MUX_uxn_opcodes_h_l940_c7_801b
t8_MUX_uxn_opcodes_h_l940_c7_801b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l940_c7_801b_cond,
t8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue,
t8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse,
t8_MUX_uxn_opcodes_h_l940_c7_801b_return_output);

-- n8_MUX_uxn_opcodes_h_l940_c7_801b
n8_MUX_uxn_opcodes_h_l940_c7_801b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l940_c7_801b_cond,
n8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue,
n8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse,
n8_MUX_uxn_opcodes_h_l940_c7_801b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b
result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b
result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_cond,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054
BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_left,
BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_right,
BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output);

-- t8_MUX_uxn_opcodes_h_l943_c7_b26c
t8_MUX_uxn_opcodes_h_l943_c7_b26c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l943_c7_b26c_cond,
t8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue,
t8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse,
t8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output);

-- n8_MUX_uxn_opcodes_h_l943_c7_b26c
n8_MUX_uxn_opcodes_h_l943_c7_b26c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l943_c7_b26c_cond,
n8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue,
n8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse,
n8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c
result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c
result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c
result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c
result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c
result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c
result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_cond,
result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e
BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_left,
BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_right,
BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output);

-- n8_MUX_uxn_opcodes_h_l947_c7_df7e
n8_MUX_uxn_opcodes_h_l947_c7_df7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l947_c7_df7e_cond,
n8_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue,
n8_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse,
n8_MUX_uxn_opcodes_h_l947_c7_df7e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e
result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_cond,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c
BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_left,
BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_right,
BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output);

-- n8_MUX_uxn_opcodes_h_l950_c7_e6a3
n8_MUX_uxn_opcodes_h_l950_c7_e6a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l950_c7_e6a3_cond,
n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue,
n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse,
n8_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3
result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3
result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a
BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_left,
BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_right,
BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0
BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_left,
BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_right,
BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_return_output);

-- MUX_uxn_opcodes_h_l954_c32_fdb4
MUX_uxn_opcodes_h_l954_c32_fdb4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l954_c32_fdb4_cond,
MUX_uxn_opcodes_h_l954_c32_fdb4_iftrue,
MUX_uxn_opcodes_h_l954_c32_fdb4_iffalse,
MUX_uxn_opcodes_h_l954_c32_fdb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb
BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_left,
BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_right,
BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17
result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17
result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_cond,
result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f
BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_left,
BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_right,
BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_return_output);

-- MUX_uxn_opcodes_h_l960_c24_aa18
MUX_uxn_opcodes_h_l960_c24_aa18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l960_c24_aa18_cond,
MUX_uxn_opcodes_h_l960_c24_aa18_iftrue,
MUX_uxn_opcodes_h_l960_c24_aa18_iffalse,
MUX_uxn_opcodes_h_l960_c24_aa18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05
BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_return_output,
 t8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
 n8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output,
 t8_MUX_uxn_opcodes_h_l940_c7_801b_return_output,
 n8_MUX_uxn_opcodes_h_l940_c7_801b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output,
 t8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output,
 n8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output,
 n8_MUX_uxn_opcodes_h_l947_c7_df7e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output,
 n8_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_return_output,
 MUX_uxn_opcodes_h_l954_c32_fdb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_return_output,
 MUX_uxn_opcodes_h_l960_c24_aa18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l937_c3_2846 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l935_c3_1d47_uxn_opcodes_h_l935_c3_1d47_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_a756 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(15 downto 0);
 variable VAR_t8_uxn_opcodes_h_l944_c3_4422 : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_3c45 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l948_c3_eb85 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(15 downto 0);
 variable VAR_n8_uxn_opcodes_h_l951_c3_f440 : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_f8ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l960_c24_aa18_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l960_c24_aa18_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l960_c24_aa18_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l960_c24_aa18_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l943_l940_l934_l950_l947_DUPLICATE_ff83_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l943_l940_l934_l962_l950_l947_DUPLICATE_ee1d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l943_l940_l934_l956_l947_DUPLICATE_b1cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l943_l940_l934_l956_l950_l947_DUPLICATE_577e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l943_l947_l940_l950_DUPLICATE_2a5d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l943_l940_l962_l956_l950_l947_DUPLICATE_891a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l956_l950_DUPLICATE_d4f3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l930_l967_DUPLICATE_fbf4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l948_c3_eb85 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l948_c3_eb85;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l960_c24_aa18_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l937_c3_2846 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l937_c3_2846;
     VAR_BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_f8ef := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_f8ef;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_3c45 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_3c45;
     VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l960_c24_aa18_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_a756 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l941_c3_a756;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_left := VAR_phase;
     VAR_n8_uxn_opcodes_h_l951_c3_f440 := resize(VAR_previous_stack_read, 16);
     VAR_t8_uxn_opcodes_h_l944_c3_4422 := resize(VAR_previous_stack_read, 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse := t8;
     VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue := VAR_n8_uxn_opcodes_h_l951_c3_f440;
     VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue := VAR_t8_uxn_opcodes_h_l944_c3_4422;
     -- BIN_OP_EQ[uxn_opcodes_h_l956_c11_4fcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l943_l940_l934_l956_l950_l947_DUPLICATE_577e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l943_l940_l934_l956_l950_l947_DUPLICATE_577e_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l950_c11_e64c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_left;
     BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output := BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l940_c11_a3aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l934_c6_490f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_left;
     BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output := BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l954_c32_6b9a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_left;
     BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_return_output := BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l947_c11_cb0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l943_c11_c054] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_left;
     BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output := BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l943_l940_l962_l956_l950_l947_DUPLICATE_891a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l943_l940_l962_l956_l950_l947_DUPLICATE_891a_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l943_l947_l940_l950_DUPLICATE_2a5d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l943_l947_l940_l950_DUPLICATE_2a5d_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l943_l940_l934_l956_l947_DUPLICATE_b1cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l943_l940_l934_l956_l947_DUPLICATE_b1cc_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l943_l940_l934_l950_l947_DUPLICATE_ff83 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l943_l940_l934_l950_l947_DUPLICATE_ff83_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l956_l950_DUPLICATE_d4f3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l956_l950_DUPLICATE_d4f3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c11_2e05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l960_c24_6d7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l943_l940_l934_l962_l950_l947_DUPLICATE_ee1d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l943_l940_l934_l962_l950_l947_DUPLICATE_ee1d_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l954_c32_6b9a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l934_c6_490f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_a3aa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l943_c11_c054_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_cb0e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l950_c11_e64c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l956_c11_4fcb_return_output;
     VAR_MUX_uxn_opcodes_h_l960_c24_aa18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c24_6d7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_2e05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l943_l940_l934_l950_l947_DUPLICATE_ff83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l943_l940_l934_l950_l947_DUPLICATE_ff83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l943_l940_l934_l950_l947_DUPLICATE_ff83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l943_l940_l934_l950_l947_DUPLICATE_ff83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l943_l940_l934_l950_l947_DUPLICATE_ff83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l943_l940_l962_l956_l950_l947_DUPLICATE_891a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l943_l940_l962_l956_l950_l947_DUPLICATE_891a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l943_l940_l962_l956_l950_l947_DUPLICATE_891a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l943_l940_l962_l956_l950_l947_DUPLICATE_891a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l943_l940_l962_l956_l950_l947_DUPLICATE_891a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l943_l940_l962_l956_l950_l947_DUPLICATE_891a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l943_l940_l934_l956_l947_DUPLICATE_b1cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l943_l940_l934_l956_l947_DUPLICATE_b1cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l943_l940_l934_l956_l947_DUPLICATE_b1cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l943_l940_l934_l956_l947_DUPLICATE_b1cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l943_l940_l934_l956_l947_DUPLICATE_b1cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l943_l947_l940_l950_DUPLICATE_2a5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l943_l947_l940_l950_DUPLICATE_2a5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l943_l947_l940_l950_DUPLICATE_2a5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l943_l947_l940_l950_DUPLICATE_2a5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l943_l940_l934_l962_l950_l947_DUPLICATE_ee1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l943_l940_l934_l962_l950_l947_DUPLICATE_ee1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l943_l940_l934_l962_l950_l947_DUPLICATE_ee1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l943_l940_l934_l962_l950_l947_DUPLICATE_ee1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l943_l940_l934_l962_l950_l947_DUPLICATE_ee1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l943_l940_l934_l962_l950_l947_DUPLICATE_ee1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l956_l950_DUPLICATE_d4f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l956_l950_DUPLICATE_d4f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l943_l940_l934_l956_l950_l947_DUPLICATE_577e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l943_l940_l934_l956_l950_l947_DUPLICATE_577e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l943_l940_l934_l956_l950_l947_DUPLICATE_577e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l943_l940_l934_l956_l950_l947_DUPLICATE_577e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l943_l940_l934_l956_l950_l947_DUPLICATE_577e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l943_l940_l934_l956_l950_l947_DUPLICATE_577e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l956_c7_1b17] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l950_c7_e6a3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l934_c1_0e84] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_return_output;

     -- t8_MUX[uxn_opcodes_h_l943_c7_b26c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l943_c7_b26c_cond <= VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_cond;
     t8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue;
     t8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output := t8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;

     -- MUX[uxn_opcodes_h_l960_c24_aa18] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l960_c24_aa18_cond <= VAR_MUX_uxn_opcodes_h_l960_c24_aa18_cond;
     MUX_uxn_opcodes_h_l960_c24_aa18_iftrue <= VAR_MUX_uxn_opcodes_h_l960_c24_aa18_iftrue;
     MUX_uxn_opcodes_h_l960_c24_aa18_iffalse <= VAR_MUX_uxn_opcodes_h_l960_c24_aa18_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l960_c24_aa18_return_output := MUX_uxn_opcodes_h_l960_c24_aa18_return_output;

     -- n8_MUX[uxn_opcodes_h_l950_c7_e6a3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l950_c7_e6a3_cond <= VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_cond;
     n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue;
     n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output := n8_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_7f7f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_7f7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l956_c7_1b17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l954_c32_10c0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_left;
     BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_return_output := BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l954_c32_10c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue := VAR_MUX_uxn_opcodes_h_l960_c24_aa18_return_output;
     VAR_printf_uxn_opcodes_h_l935_c3_1d47_uxn_opcodes_h_l935_c3_1d47_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l934_c1_0e84_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l956_c7_1b17_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_7f7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l956_c7_1b17_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l950_c7_e6a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l956_c7_1b17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l947_c7_df7e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l950_c7_e6a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;

     -- t8_MUX[uxn_opcodes_h_l940_c7_801b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l940_c7_801b_cond <= VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_cond;
     t8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue;
     t8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_return_output := t8_MUX_uxn_opcodes_h_l940_c7_801b_return_output;

     -- MUX[uxn_opcodes_h_l954_c32_fdb4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l954_c32_fdb4_cond <= VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_cond;
     MUX_uxn_opcodes_h_l954_c32_fdb4_iftrue <= VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_iftrue;
     MUX_uxn_opcodes_h_l954_c32_fdb4_iffalse <= VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_return_output := MUX_uxn_opcodes_h_l954_c32_fdb4_return_output;

     -- printf_uxn_opcodes_h_l935_c3_1d47[uxn_opcodes_h_l935_c3_1d47] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l935_c3_1d47_uxn_opcodes_h_l935_c3_1d47_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l935_c3_1d47_uxn_opcodes_h_l935_c3_1d47_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l947_c7_df7e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l947_c7_df7e_cond <= VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_cond;
     n8_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue;
     n8_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_return_output := n8_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l956_c7_1b17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l956_c7_1b17] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_cond;
     result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_return_output := result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue := VAR_MUX_uxn_opcodes_h_l954_c32_fdb4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l956_c7_1b17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l956_c7_1b17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l956_c7_1b17_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l940_c7_801b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l950_c7_e6a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l947_c7_df7e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;

     -- t8_MUX[uxn_opcodes_h_l934_c2_eca7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l934_c2_eca7_cond <= VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_cond;
     t8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue;
     t8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output := t8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l950_c7_e6a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l943_c7_b26c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l950_c7_e6a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l950_c7_e6a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l947_c7_df7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;

     -- n8_MUX[uxn_opcodes_h_l943_c7_b26c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l943_c7_b26c_cond <= VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_cond;
     n8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue;
     n8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output := n8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l950_c7_e6a3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l940_c7_801b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_return_output;

     -- n8_MUX[uxn_opcodes_h_l940_c7_801b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l940_c7_801b_cond <= VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_cond;
     n8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_iftrue;
     n8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_return_output := n8_MUX_uxn_opcodes_h_l940_c7_801b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l943_c7_b26c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l947_c7_df7e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_return_output := result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l947_c7_df7e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l947_c7_df7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l943_c7_b26c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l947_c7_df7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l940_c7_801b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_801b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_df7e_return_output;
     -- n8_MUX[uxn_opcodes_h_l934_c2_eca7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l934_c2_eca7_cond <= VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_cond;
     n8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue;
     n8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output := n8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l943_c7_b26c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l943_c7_b26c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l943_c7_b26c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_return_output := result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l940_c7_801b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l934_c2_eca7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l943_c7_b26c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_801b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l934_c2_eca7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_801b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l943_c7_b26c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l934_c2_eca7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c7_801b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_801b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l934_c2_eca7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l940_c7_801b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_return_output := result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_801b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_801b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_801b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_801b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_801b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l934_c2_eca7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l934_c2_eca7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l934_c2_eca7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l934_c2_eca7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_return_output := result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l930_l967_DUPLICATE_fbf4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l930_l967_DUPLICATE_fbf4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l934_c2_eca7_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l934_c2_eca7_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l930_l967_DUPLICATE_fbf4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l930_l967_DUPLICATE_fbf4_return_output;
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
