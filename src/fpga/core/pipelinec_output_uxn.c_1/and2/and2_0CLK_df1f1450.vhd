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
-- Submodules: 114
entity and2_0CLK_df1f1450 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_df1f1450;
architecture arch of and2_0CLK_df1f1450 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_9936]
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1000_c1_83cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1000_c2_5711]
signal tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1000_c2_5711]
signal t16_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1000_c2_5711]
signal n16_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1000_c2_5711]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1000_c2_5711]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1000_c2_5711]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1000_c2_5711]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1000_c2_5711]
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1000_c2_5711]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1001_c3_db24[uxn_opcodes_h_l1001_c3_db24]
signal printf_uxn_opcodes_h_l1001_c3_db24_uxn_opcodes_h_l1001_c3_db24_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_fd0b]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1005_c7_57dd]
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1005_c7_57dd]
signal t16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1005_c7_57dd]
signal n16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_57dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_57dd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_57dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_57dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1005_c7_57dd]
signal result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_57dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_e439]
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1008_c7_83f6]
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1008_c7_83f6]
signal t16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1008_c7_83f6]
signal n16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1008_c7_83f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1008_c7_83f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1008_c7_83f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1008_c7_83f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1008_c7_83f6]
signal result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1008_c7_83f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_a960]
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1013_c7_6cda]
signal tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1013_c7_6cda]
signal t16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1013_c7_6cda]
signal n16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1013_c7_6cda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1013_c7_6cda]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1013_c7_6cda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1013_c7_6cda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1013_c7_6cda]
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1013_c7_6cda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_c304]
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1016_c7_1223]
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1016_c7_1223]
signal t16_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1016_c7_1223]
signal n16_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_1223]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1016_c7_1223]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_1223]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1016_c7_1223]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1016_c7_1223]
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_1223]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1017_c3_655f]
signal BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_24df]
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1020_c7_2160]
signal tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1020_c7_2160]
signal n16_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1020_c7_2160]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1020_c7_2160]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1020_c7_2160]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1020_c7_2160]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1020_c7_2160]
signal result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1020_c7_2160]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_9c7d]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1023_c7_c299]
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1023_c7_c299]
signal n16_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_c299]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_c299]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_c299]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_c299]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_c299]
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_c299]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_f0ab]
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1028_c7_ab67]
signal tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1028_c7_ab67]
signal n16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_ab67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1028_c7_ab67]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1028_c7_ab67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1028_c7_ab67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1028_c7_ab67]
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_ab67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_b756]
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1031_c7_117e]
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1031_c7_117e]
signal n16_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1031_c7_117e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1031_c7_117e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1031_c7_117e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1031_c7_117e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1031_c7_117e]
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1031_c7_117e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1032_c3_f858]
signal BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1033_c11_1922]
signal BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1035_c32_dc32]
signal BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1035_c32_4d3e]
signal BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1035_c32_6d91]
signal MUX_uxn_opcodes_h_l1035_c32_6d91_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1035_c32_6d91_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1035_c32_6d91_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1035_c32_6d91_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_9b82]
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_b3e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_b3e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_b3e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_b3e7]
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_b3e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_8e39]
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1043_c7_c29e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1043_c7_c29e]
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1043_c7_c29e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1043_c7_c29e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1045_c34_b71e]
signal CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_1620]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1047_c7_aa4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1047_c7_aa4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_left,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_right,
BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1000_c2_5711
tmp16_MUX_uxn_opcodes_h_l1000_c2_5711 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_cond,
tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue,
tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse,
tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output);

-- t16_MUX_uxn_opcodes_h_l1000_c2_5711
t16_MUX_uxn_opcodes_h_l1000_c2_5711 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1000_c2_5711_cond,
t16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue,
t16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse,
t16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output);

-- n16_MUX_uxn_opcodes_h_l1000_c2_5711
n16_MUX_uxn_opcodes_h_l1000_c2_5711 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1000_c2_5711_cond,
n16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue,
n16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse,
n16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711
result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_cond,
result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_return_output);

-- printf_uxn_opcodes_h_l1001_c3_db24_uxn_opcodes_h_l1001_c3_db24
printf_uxn_opcodes_h_l1001_c3_db24_uxn_opcodes_h_l1001_c3_db24 : entity work.printf_uxn_opcodes_h_l1001_c3_db24_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1001_c3_db24_uxn_opcodes_h_l1001_c3_db24_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd
tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond,
tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output);

-- t16_MUX_uxn_opcodes_h_l1005_c7_57dd
t16_MUX_uxn_opcodes_h_l1005_c7_57dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond,
t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue,
t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse,
t16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output);

-- n16_MUX_uxn_opcodes_h_l1005_c7_57dd
n16_MUX_uxn_opcodes_h_l1005_c7_57dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond,
n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue,
n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse,
n16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd
result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_left,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_right,
BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6
tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond,
tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output);

-- t16_MUX_uxn_opcodes_h_l1008_c7_83f6
t16_MUX_uxn_opcodes_h_l1008_c7_83f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond,
t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue,
t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse,
t16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output);

-- n16_MUX_uxn_opcodes_h_l1008_c7_83f6
n16_MUX_uxn_opcodes_h_l1008_c7_83f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond,
n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue,
n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse,
n16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6
result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_left,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_right,
BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda
tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond,
tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue,
tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse,
tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output);

-- t16_MUX_uxn_opcodes_h_l1013_c7_6cda
t16_MUX_uxn_opcodes_h_l1013_c7_6cda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond,
t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue,
t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse,
t16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output);

-- n16_MUX_uxn_opcodes_h_l1013_c7_6cda
n16_MUX_uxn_opcodes_h_l1013_c7_6cda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond,
n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue,
n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse,
n16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda
result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_cond,
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_left,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_right,
BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1016_c7_1223
tmp16_MUX_uxn_opcodes_h_l1016_c7_1223 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_cond,
tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue,
tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse,
tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output);

-- t16_MUX_uxn_opcodes_h_l1016_c7_1223
t16_MUX_uxn_opcodes_h_l1016_c7_1223 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1016_c7_1223_cond,
t16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue,
t16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse,
t16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output);

-- n16_MUX_uxn_opcodes_h_l1016_c7_1223
n16_MUX_uxn_opcodes_h_l1016_c7_1223 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1016_c7_1223_cond,
n16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue,
n16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse,
n16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_cond,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f
BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_left,
BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_right,
BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_left,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_right,
BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1020_c7_2160
tmp16_MUX_uxn_opcodes_h_l1020_c7_2160 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_cond,
tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue,
tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse,
tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output);

-- n16_MUX_uxn_opcodes_h_l1020_c7_2160
n16_MUX_uxn_opcodes_h_l1020_c7_2160 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1020_c7_2160_cond,
n16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue,
n16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse,
n16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160
result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160
result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160
result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_cond,
result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1023_c7_c299
tmp16_MUX_uxn_opcodes_h_l1023_c7_c299 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_cond,
tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue,
tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse,
tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output);

-- n16_MUX_uxn_opcodes_h_l1023_c7_c299
n16_MUX_uxn_opcodes_h_l1023_c7_c299 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1023_c7_c299_cond,
n16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue,
n16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse,
n16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_cond,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_left,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_right,
BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67
tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond,
tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue,
tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse,
tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output);

-- n16_MUX_uxn_opcodes_h_l1028_c7_ab67
n16_MUX_uxn_opcodes_h_l1028_c7_ab67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond,
n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue,
n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse,
n16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67
result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_cond,
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_left,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_right,
BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1031_c7_117e
tmp16_MUX_uxn_opcodes_h_l1031_c7_117e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_cond,
tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output);

-- n16_MUX_uxn_opcodes_h_l1031_c7_117e
n16_MUX_uxn_opcodes_h_l1031_c7_117e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1031_c7_117e_cond,
n16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue,
n16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse,
n16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e
result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858
BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_left,
BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_right,
BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922
BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_left,
BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_right,
BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32
BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_left,
BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_right,
BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e
BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_left,
BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_right,
BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_return_output);

-- MUX_uxn_opcodes_h_l1035_c32_6d91
MUX_uxn_opcodes_h_l1035_c32_6d91 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1035_c32_6d91_cond,
MUX_uxn_opcodes_h_l1035_c32_6d91_iftrue,
MUX_uxn_opcodes_h_l1035_c32_6d91_iffalse,
MUX_uxn_opcodes_h_l1035_c32_6d91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_left,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_right,
BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_left,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_right,
BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e
CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_x,
CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e
CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
 t16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
 n16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output,
 t16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output,
 n16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output,
 tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output,
 t16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output,
 n16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output,
 tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output,
 t16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output,
 n16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output,
 tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output,
 t16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output,
 n16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output,
 tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output,
 n16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output,
 n16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output,
 n16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output,
 tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output,
 n16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_return_output,
 MUX_uxn_opcodes_h_l1035_c32_6d91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output,
 CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_2bcb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1001_c3_db24_uxn_opcodes_h_l1001_c3_db24_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1006_c3_ae74 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1011_c3_303f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_0cb8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1018_c3_466d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1021_c3_5d12 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1026_c3_ece1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1029_c3_a732 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_2bbd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1041_c24_d7bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_e949 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1045_c24_0800_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1024_l1017_l1032_DUPLICATE_2c90_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1031_l1043_DUPLICATE_fdab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1052_l996_DUPLICATE_c4d8_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1011_c3_303f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1011_c3_303f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_e949 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_e949;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1021_c3_5d12 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1021_c3_5d12;
     VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_2bcb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1002_c3_2bcb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_0cb8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1014_c3_0cb8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1029_c3_a732 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1029_c3_a732;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1018_c3_466d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1018_c3_466d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1026_c3_ece1 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1026_c3_ece1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_2bbd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_2bbd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1006_c3_ae74 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1006_c3_ae74;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1028_c11_f0ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1035_c32_dc32] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_left;
     BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_return_output := BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1031_l1043_DUPLICATE_fdab LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1031_l1043_DUPLICATE_fdab_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1016_c11_c304] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_left;
     BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output := BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1024_l1017_l1032_DUPLICATE_2c90 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1024_l1017_l1032_DUPLICATE_2c90_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1031_c11_b756] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_left;
     BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output := BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_9c7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1013_c11_a960] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_left;
     BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output := BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_1620] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1041_c24_d7bb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1041_c24_d7bb_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1020_c11_24df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l1045_c34_b71e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_return_output := CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1008_c11_e439] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_left;
     BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output := BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1043_c11_8e39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_left;
     BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_return_output := BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1037_c11_9b82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_left;
     BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_return_output := BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_fd0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1000_c6_9936] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_left;
     BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output := BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1035_c32_dc32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1000_c6_9936_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_fd0b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1008_c11_e439_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1013_c11_a960_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1016_c11_c304_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1020_c11_24df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_9c7d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1028_c11_f0ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1031_c11_b756_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1037_c11_9b82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1043_c11_8e39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1620_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1024_l1017_l1032_DUPLICATE_2c90_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1024_l1017_l1032_DUPLICATE_2c90_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1009_l1024_l1017_l1032_DUPLICATE_2c90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1041_c24_d7bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_a227_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1031_l1005_l1028_l1023_l1020_l1047_l1016_l1043_DUPLICATE_596a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1013_l1037_l1008_l1005_l1028_l1000_l1023_l1020_l1016_DUPLICATE_1dd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1047_l1016_l1043_DUPLICATE_10d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1031_l1043_DUPLICATE_fdab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1031_l1043_DUPLICATE_fdab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1013_l1008_l1031_l1005_l1028_l1000_l1023_l1020_l1016_l1043_DUPLICATE_9df8_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1035_c32_4d3e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_left;
     BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_return_output := BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1017_c3_655f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_left;
     BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_return_output := BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1037_c7_b3e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1047_c7_aa4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1045_c24_0800] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1045_c24_0800_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1045_c34_b71e_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1047_c7_aa4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1032_c3_f858] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_left;
     BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_return_output := BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1043_c7_c29e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1000_c1_83cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1035_c32_4d3e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1017_c3_655f_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_right := VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1032_c3_f858_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1045_c24_0800_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1010_l1025_DUPLICATE_0b6e_return_output;
     VAR_printf_uxn_opcodes_h_l1001_c3_db24_uxn_opcodes_h_l1001_c3_db24_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1000_c1_83cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_aa4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1043_c7_c29e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1016_c7_1223] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1016_c7_1223_cond <= VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_cond;
     t16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue;
     t16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output := t16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;

     -- printf_uxn_opcodes_h_l1001_c3_db24[uxn_opcodes_h_l1001_c3_db24] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1001_c3_db24_uxn_opcodes_h_l1001_c3_db24_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1001_c3_db24_uxn_opcodes_h_l1001_c3_db24_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1031_c7_117e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1031_c7_117e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1031_c7_117e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_cond;
     n16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue;
     n16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output := n16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1033_c11_1922] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_left;
     BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_return_output := BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1043_c7_c29e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output;

     -- MUX[uxn_opcodes_h_l1035_c32_6d91] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1035_c32_6d91_cond <= VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_cond;
     MUX_uxn_opcodes_h_l1035_c32_6d91_iftrue <= VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_iftrue;
     MUX_uxn_opcodes_h_l1035_c32_6d91_iffalse <= VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_return_output := MUX_uxn_opcodes_h_l1035_c32_6d91_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1043_c7_c29e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1037_c7_b3e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1033_c11_1922_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue := VAR_MUX_uxn_opcodes_h_l1035_c32_6d91_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1043_c7_c29e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1031_c7_117e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1028_c7_ab67] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1031_c7_117e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_cond;
     tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output := tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1028_c7_ab67] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond <= VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond;
     n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue;
     n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output := n16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1037_c7_b3e7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1031_c7_117e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1037_c7_b3e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1013_c7_6cda] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond <= VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond;
     t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue;
     t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output := t16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1037_c7_b3e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1037_c7_b3e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1031_c7_117e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1031_c7_117e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1028_c7_ab67] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_cond;
     tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output := tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;

     -- t16_MUX[uxn_opcodes_h_l1008_c7_83f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond;
     t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue;
     t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output := t16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1023_c7_c299] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1023_c7_c299_cond <= VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_cond;
     n16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue;
     n16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output := n16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1031_c7_117e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1023_c7_c299] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1028_c7_ab67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1028_c7_ab67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1031_c7_117e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1028_c7_ab67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1028_c7_ab67] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output := result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;

     -- n16_MUX[uxn_opcodes_h_l1020_c7_2160] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1020_c7_2160_cond <= VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_cond;
     n16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue;
     n16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output := n16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1023_c7_c299] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1028_c7_ab67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1023_c7_c299] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;

     -- t16_MUX[uxn_opcodes_h_l1005_c7_57dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond;
     t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue;
     t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output := t16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1020_c7_2160] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1023_c7_c299] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_cond;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output := tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1028_c7_ab67_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1020_c7_2160] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_c299] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_c299] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1020_c7_2160] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_cond;
     tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output := tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;

     -- n16_MUX[uxn_opcodes_h_l1016_c7_1223] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1016_c7_1223_cond <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_cond;
     n16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue;
     n16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output := n16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1020_c7_2160] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1016_c7_1223] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;

     -- t16_MUX[uxn_opcodes_h_l1000_c2_5711] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1000_c2_5711_cond <= VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_cond;
     t16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue;
     t16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output := t16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1023_c7_c299] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_return_output := result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1023_c7_c299_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1013_c7_6cda] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1020_c7_2160] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1016_c7_1223] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;

     -- n16_MUX[uxn_opcodes_h_l1013_c7_6cda] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond <= VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond;
     n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue;
     n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output := n16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1016_c7_1223] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1016_c7_1223] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_cond;
     tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output := tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1020_c7_2160] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_return_output := result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1020_c7_2160] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1020_c7_2160_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1016_c7_1223] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_return_output := result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1016_c7_1223] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1013_c7_6cda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1016_c7_1223] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1013_c7_6cda] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_cond;
     tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output := tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;

     -- n16_MUX[uxn_opcodes_h_l1008_c7_83f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond;
     n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue;
     n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output := n16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1013_c7_6cda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1008_c7_83f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1016_c7_1223_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1008_c7_83f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1013_c7_6cda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1013_c7_6cda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1013_c7_6cda] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output := result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1008_c7_83f6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_cond;
     tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output := tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1005_c7_57dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond;
     n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue;
     n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output := n16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1008_c7_83f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_57dd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1013_c7_6cda_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1000_c2_5711] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_57dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1008_c7_83f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1008_c7_83f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_57dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1000_c2_5711] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1000_c2_5711_cond <= VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_cond;
     n16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue;
     n16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output := n16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1008_c7_83f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1005_c7_57dd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_cond;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output := tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1008_c7_83f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1005_c7_57dd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_57dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1000_c2_5711] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1000_c2_5711] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_cond;
     tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output := tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_57dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1000_c2_5711] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1005_c7_57dd_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1000_c2_5711] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1000_c2_5711] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_return_output := result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1000_c2_5711] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1052_l996_DUPLICATE_c4d8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1052_l996_DUPLICATE_c4d8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1000_c2_5711_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1000_c2_5711_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1052_l996_DUPLICATE_c4d8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1052_l996_DUPLICATE_c4d8_return_output;
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
