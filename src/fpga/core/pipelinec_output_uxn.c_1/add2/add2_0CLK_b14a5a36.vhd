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
-- Submodules: 124
entity add2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_b14a5a36;
architecture arch of add2_0CLK_b14a5a36 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l647_c6_a17d]
signal BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l647_c1_2f67]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l647_c2_2b4f]
signal n16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l647_c2_2b4f]
signal t16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l647_c2_2b4f]
signal tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l647_c2_2b4f]
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l647_c2_2b4f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l647_c2_2b4f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l647_c2_2b4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l647_c2_2b4f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l647_c2_2b4f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l647_c2_2b4f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l647_c2_2b4f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l648_c3_3f26[uxn_opcodes_h_l648_c3_3f26]
signal printf_uxn_opcodes_h_l648_c3_3f26_uxn_opcodes_h_l648_c3_3f26_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l655_c11_bd28]
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l655_c7_cff5]
signal n16_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l655_c7_cff5]
signal t16_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l655_c7_cff5]
signal tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l655_c7_cff5]
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l655_c7_cff5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l655_c7_cff5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_cff5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_cff5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_cff5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l655_c7_cff5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l659_c11_f481]
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l659_c7_df6b]
signal n16_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l659_c7_df6b]
signal t16_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l659_c7_df6b]
signal tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l659_c7_df6b]
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l659_c7_df6b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l659_c7_df6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l659_c7_df6b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l659_c7_df6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c7_df6b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c7_df6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l665_c11_20b6]
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l665_c7_f97e]
signal n16_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l665_c7_f97e]
signal t16_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l665_c7_f97e]
signal tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l665_c7_f97e]
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l665_c7_f97e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l665_c7_f97e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l665_c7_f97e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l665_c7_f97e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c7_f97e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l665_c7_f97e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l669_c11_ff30]
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l669_c7_77a4]
signal n16_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l669_c7_77a4]
signal t16_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l669_c7_77a4]
signal tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l669_c7_77a4]
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l669_c7_77a4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l669_c7_77a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l669_c7_77a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l669_c7_77a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l669_c7_77a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l669_c7_77a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l670_c3_c2ef]
signal BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l674_c11_f77f]
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l674_c7_bad8]
signal n16_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l674_c7_bad8]
signal tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l674_c7_bad8]
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l674_c7_bad8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l674_c7_bad8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l674_c7_bad8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_bad8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_bad8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l674_c7_bad8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l678_c11_9c46]
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l678_c7_bbac]
signal n16_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l678_c7_bbac]
signal tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l678_c7_bbac]
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l678_c7_bbac]
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l678_c7_bbac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l678_c7_bbac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_bbac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_bbac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l678_c7_bbac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l684_c11_2acd]
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l684_c7_cb7f]
signal n16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l684_c7_cb7f]
signal tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l684_c7_cb7f]
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l684_c7_cb7f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l684_c7_cb7f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_cb7f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_cb7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_cb7f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_cb7f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l688_c11_5a87]
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l688_c7_1658]
signal n16_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l688_c7_1658]
signal tmp16_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l688_c7_1658]
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l688_c7_1658]
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l688_c7_1658]
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c7_1658]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_1658]
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_1658]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_1658]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l689_c3_02e1]
signal BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l690_c11_72b2]
signal BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l693_c32_cd51]
signal BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l693_c32_0ff0]
signal BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l693_c32_c5cc]
signal MUX_uxn_opcodes_h_l693_c32_c5cc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l693_c32_c5cc_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l693_c32_c5cc_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l693_c32_c5cc_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l695_c11_58d1]
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l695_c7_4e9e]
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l695_c7_4e9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_4e9e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_4e9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_4e9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l701_c11_196a]
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l701_c7_5d3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l701_c7_5d3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l701_c7_5d3c]
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l701_c7_5d3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l704_c34_c8eb]
signal CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l706_c11_d49d]
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_f016]
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l706_c7_f016]
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_81ab( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d
BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_left,
BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_right,
BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_return_output);

-- n16_MUX_uxn_opcodes_h_l647_c2_2b4f
n16_MUX_uxn_opcodes_h_l647_c2_2b4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond,
n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue,
n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse,
n16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

-- t16_MUX_uxn_opcodes_h_l647_c2_2b4f
t16_MUX_uxn_opcodes_h_l647_c2_2b4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond,
t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue,
t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse,
t16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f
tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond,
tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue,
tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse,
tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f
result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_cond,
result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

-- printf_uxn_opcodes_h_l648_c3_3f26_uxn_opcodes_h_l648_c3_3f26
printf_uxn_opcodes_h_l648_c3_3f26_uxn_opcodes_h_l648_c3_3f26 : entity work.printf_uxn_opcodes_h_l648_c3_3f26_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l648_c3_3f26_uxn_opcodes_h_l648_c3_3f26_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28
BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_left,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_right,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output);

-- n16_MUX_uxn_opcodes_h_l655_c7_cff5
n16_MUX_uxn_opcodes_h_l655_c7_cff5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l655_c7_cff5_cond,
n16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue,
n16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse,
n16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output);

-- t16_MUX_uxn_opcodes_h_l655_c7_cff5
t16_MUX_uxn_opcodes_h_l655_c7_cff5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l655_c7_cff5_cond,
t16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue,
t16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse,
t16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l655_c7_cff5
tmp16_MUX_uxn_opcodes_h_l655_c7_cff5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_cond,
tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue,
tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse,
tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5
result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_cond,
result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481
BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_left,
BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_right,
BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output);

-- n16_MUX_uxn_opcodes_h_l659_c7_df6b
n16_MUX_uxn_opcodes_h_l659_c7_df6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l659_c7_df6b_cond,
n16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue,
n16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse,
n16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output);

-- t16_MUX_uxn_opcodes_h_l659_c7_df6b
t16_MUX_uxn_opcodes_h_l659_c7_df6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l659_c7_df6b_cond,
t16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue,
t16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse,
t16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l659_c7_df6b
tmp16_MUX_uxn_opcodes_h_l659_c7_df6b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_cond,
tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue,
tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse,
tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b
result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_cond,
result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6
BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_left,
BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_right,
BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output);

-- n16_MUX_uxn_opcodes_h_l665_c7_f97e
n16_MUX_uxn_opcodes_h_l665_c7_f97e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l665_c7_f97e_cond,
n16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue,
n16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse,
n16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output);

-- t16_MUX_uxn_opcodes_h_l665_c7_f97e
t16_MUX_uxn_opcodes_h_l665_c7_f97e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l665_c7_f97e_cond,
t16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue,
t16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse,
t16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l665_c7_f97e
tmp16_MUX_uxn_opcodes_h_l665_c7_f97e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_cond,
tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue,
tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse,
tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e
result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_cond,
result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30
BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_left,
BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_right,
BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output);

-- n16_MUX_uxn_opcodes_h_l669_c7_77a4
n16_MUX_uxn_opcodes_h_l669_c7_77a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l669_c7_77a4_cond,
n16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue,
n16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse,
n16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output);

-- t16_MUX_uxn_opcodes_h_l669_c7_77a4
t16_MUX_uxn_opcodes_h_l669_c7_77a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l669_c7_77a4_cond,
t16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue,
t16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse,
t16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l669_c7_77a4
tmp16_MUX_uxn_opcodes_h_l669_c7_77a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_cond,
tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue,
tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse,
tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4
result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_cond,
result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef
BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_left,
BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_right,
BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f
BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_left,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_right,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output);

-- n16_MUX_uxn_opcodes_h_l674_c7_bad8
n16_MUX_uxn_opcodes_h_l674_c7_bad8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l674_c7_bad8_cond,
n16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue,
n16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse,
n16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l674_c7_bad8
tmp16_MUX_uxn_opcodes_h_l674_c7_bad8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_cond,
tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue,
tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse,
tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8
result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_cond,
result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46
BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_left,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_right,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output);

-- n16_MUX_uxn_opcodes_h_l678_c7_bbac
n16_MUX_uxn_opcodes_h_l678_c7_bbac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l678_c7_bbac_cond,
n16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue,
n16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse,
n16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l678_c7_bbac
tmp16_MUX_uxn_opcodes_h_l678_c7_bbac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_cond,
tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue,
tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse,
tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac
result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_cond,
result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd
BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_left,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_right,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output);

-- n16_MUX_uxn_opcodes_h_l684_c7_cb7f
n16_MUX_uxn_opcodes_h_l684_c7_cb7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond,
n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue,
n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse,
n16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f
tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond,
tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue,
tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse,
tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f
result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_cond,
result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87
BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_left,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_right,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output);

-- n16_MUX_uxn_opcodes_h_l688_c7_1658
n16_MUX_uxn_opcodes_h_l688_c7_1658 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l688_c7_1658_cond,
n16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue,
n16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse,
n16_MUX_uxn_opcodes_h_l688_c7_1658_return_output);

-- tmp16_MUX_uxn_opcodes_h_l688_c7_1658
tmp16_MUX_uxn_opcodes_h_l688_c7_1658 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l688_c7_1658_cond,
tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue,
tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse,
tmp16_MUX_uxn_opcodes_h_l688_c7_1658_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658
result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_cond,
result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1
BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_left,
BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_right,
BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_left,
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_right,
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51
BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_left,
BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_right,
BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0
BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_left,
BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_right,
BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_return_output);

-- MUX_uxn_opcodes_h_l693_c32_c5cc
MUX_uxn_opcodes_h_l693_c32_c5cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l693_c32_c5cc_cond,
MUX_uxn_opcodes_h_l693_c32_c5cc_iftrue,
MUX_uxn_opcodes_h_l693_c32_c5cc_iffalse,
MUX_uxn_opcodes_h_l693_c32_c5cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1
BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_left,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_right,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e
result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_cond,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a
BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_left,
BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_right,
BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c
result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_cond,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb
CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_x,
CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d
BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_left,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_right,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c
CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_return_output);



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
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_return_output,
 n16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
 t16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
 tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output,
 n16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output,
 t16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output,
 tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output,
 n16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output,
 t16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output,
 tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output,
 n16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output,
 t16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output,
 tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output,
 n16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output,
 t16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output,
 n16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output,
 tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output,
 n16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output,
 tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output,
 n16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output,
 tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output,
 n16_MUX_uxn_opcodes_h_l688_c7_1658_return_output,
 tmp16_MUX_uxn_opcodes_h_l688_c7_1658_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_return_output,
 BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_return_output,
 BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_return_output,
 MUX_uxn_opcodes_h_l693_c32_c5cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output,
 CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_4a66 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l648_c3_3f26_uxn_opcodes_h_l648_c3_3f26_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_886f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_f940 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_c37b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_237c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_ad90 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_f8be : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_b474 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l690_c3_4413 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l688_c7_1658_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_b9cb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l699_c24_5549_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_5c63 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l704_c24_b052_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l670_l679_l660_l689_DUPLICATE_7592_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_d516_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l711_l643_DUPLICATE_85db_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_right := to_unsigned(10, 4);
     VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_ad90 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_ad90;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_f940 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_f940;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_886f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_886f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_b474 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_b474;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_4a66 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_4a66;
     VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_5c63 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_5c63;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_right := to_unsigned(11, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_b9cb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_b9cb;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_237c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_237c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_f8be := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_f8be;
     VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_c37b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_c37b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse := tmp16;
     -- BIN_OP_AND[uxn_opcodes_h_l693_c32_cd51] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_left;
     BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_return_output := BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l688_c7_1658] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l688_c7_1658_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l678_c11_9c46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_left;
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output := BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l655_c11_bd28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_left;
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output := BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l665_c11_20b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l695_c11_58d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l701_c11_196a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_left;
     BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_return_output := BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l647_c6_a17d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_left;
     BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output := BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output := result.is_opc_done;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l699_c24_5549] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l699_c24_5549_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l659_c11_f481] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_left;
     BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output := BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_c2_2b4f_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l684_c11_2acd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_left;
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output := BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l669_c11_ff30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_left;
     BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output := BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l706_c11_d49d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_left;
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_return_output := BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l674_c11_f77f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_left;
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output := BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_d516 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_d516_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l670_l679_l660_l689_DUPLICATE_7592 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l670_l679_l660_l689_DUPLICATE_7592_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l688_c11_5a87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_left;
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output := BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l704_c34_c8eb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_return_output := CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_cd51_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_a17d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_bd28_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_f481_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_20b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_ff30_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_f77f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_9c46_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_2acd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_58d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_196a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_d49d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l670_l679_l660_l689_DUPLICATE_7592_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l670_l679_l660_l689_DUPLICATE_7592_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l670_l679_l660_l689_DUPLICATE_7592_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l699_c24_5549_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_c071_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_d843_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_03f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_1816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_d516_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_d516_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_08f4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_c2_2b4f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l688_c7_1658_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l693_c32_0ff0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_left;
     BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_return_output := BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_4e9e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l701_c7_5d3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l670_c3_c2ef] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_left;
     BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_return_output := BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l647_c1_2f67] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l704_c24_b052] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l704_c24_b052_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_c8eb_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_f016] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l706_c7_f016] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l688_c7_1658] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l689_c3_02e1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_left;
     BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_return_output := BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_0ff0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_c2ef_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_right := VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_02e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l704_c24_b052_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l661_l680_DUPLICATE_868c_return_output;
     VAR_printf_uxn_opcodes_h_l648_c3_3f26_uxn_opcodes_h_l648_c3_3f26_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_2f67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f016_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_1658_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f016_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output;
     -- n16_MUX[uxn_opcodes_h_l688_c7_1658] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l688_c7_1658_cond <= VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_cond;
     n16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue;
     n16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_return_output := n16_MUX_uxn_opcodes_h_l688_c7_1658_return_output;

     -- t16_MUX[uxn_opcodes_h_l669_c7_77a4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l669_c7_77a4_cond <= VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_cond;
     t16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue;
     t16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output := t16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l684_c7_cb7f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l701_c7_5d3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_4e9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output;

     -- printf_uxn_opcodes_h_l648_c3_3f26[uxn_opcodes_h_l648_c3_3f26] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l648_c3_3f26_uxn_opcodes_h_l648_c3_3f26_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l648_c3_3f26_uxn_opcodes_h_l648_c3_3f26_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l693_c32_c5cc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l693_c32_c5cc_cond <= VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_cond;
     MUX_uxn_opcodes_h_l693_c32_c5cc_iftrue <= VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_iftrue;
     MUX_uxn_opcodes_h_l693_c32_c5cc_iffalse <= VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_return_output := MUX_uxn_opcodes_h_l693_c32_c5cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c7_1658] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l701_c7_5d3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l690_c11_72b2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l701_c7_5d3c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output := result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l690_c3_4413 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_72b2_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue := VAR_MUX_uxn_opcodes_h_l693_c32_c5cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l688_c7_1658_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_5d3c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue := VAR_tmp16_uxn_opcodes_h_l690_c3_4413;
     -- t16_MUX[uxn_opcodes_h_l665_c7_f97e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l665_c7_f97e_cond <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_cond;
     t16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue;
     t16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output := t16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_1658] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l688_c7_1658] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l688_c7_1658_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_cond;
     tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iftrue;
     tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_return_output := tmp16_MUX_uxn_opcodes_h_l688_c7_1658_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l678_c7_bbac] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_cb7f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l695_c7_4e9e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output := result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l695_c7_4e9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output;

     -- n16_MUX[uxn_opcodes_h_l684_c7_cb7f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond <= VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond;
     n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue;
     n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output := n16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_4e9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_1658] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_1658_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_1658_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_4e9e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_1658_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l688_c7_1658] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_cb7f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;

     -- t16_MUX[uxn_opcodes_h_l659_c7_df6b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l659_c7_df6b_cond <= VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_cond;
     t16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue;
     t16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output := t16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l674_c7_bad8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_cb7f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;

     -- n16_MUX[uxn_opcodes_h_l678_c7_bbac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l678_c7_bbac_cond <= VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_cond;
     n16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue;
     n16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output := n16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_1658] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l688_c7_1658] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_cond;
     result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_return_output := result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l678_c7_bbac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l684_c7_cb7f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_cond;
     tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output := tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_1658_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_1658_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_1658_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l678_c7_bbac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_cond;
     tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue;
     tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output := tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_cb7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l674_c7_bad8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l669_c7_77a4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l684_c7_cb7f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output := result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;

     -- n16_MUX[uxn_opcodes_h_l674_c7_bad8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l674_c7_bad8_cond <= VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_cond;
     n16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue;
     n16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output := n16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;

     -- t16_MUX[uxn_opcodes_h_l655_c7_cff5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l655_c7_cff5_cond <= VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_cond;
     t16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue;
     t16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output := t16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_bbac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l678_c7_bbac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l684_c7_cb7f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_cb7f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l678_c7_bbac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_return_output := result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_bbac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;

     -- t16_MUX[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond <= VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond;
     t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue;
     t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output := t16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;

     -- n16_MUX[uxn_opcodes_h_l669_c7_77a4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l669_c7_77a4_cond <= VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_cond;
     n16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue;
     n16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output := n16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l674_c7_bad8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l669_c7_77a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l678_c7_bbac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l674_c7_bad8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_cond;
     tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output := tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l665_c7_f97e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_bad8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_bbac_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l665_c7_f97e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l674_c7_bad8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_return_output := result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l669_c7_77a4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_cond;
     tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output := tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l659_c7_df6b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l669_c7_77a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l669_c7_77a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;

     -- n16_MUX[uxn_opcodes_h_l665_c7_f97e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l665_c7_f97e_cond <= VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_cond;
     n16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue;
     n16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output := n16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_bad8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l674_c7_bad8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_bad8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;
     -- n16_MUX[uxn_opcodes_h_l659_c7_df6b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l659_c7_df6b_cond <= VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_cond;
     n16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue;
     n16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output := n16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l665_c7_f97e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_cond;
     tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output := tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l669_c7_77a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l669_c7_77a4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_return_output := result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l655_c7_cff5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l659_c7_df6b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l665_c7_f97e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c7_f97e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l669_c7_77a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_77a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l665_c7_f97e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;

     -- n16_MUX[uxn_opcodes_h_l655_c7_cff5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l655_c7_cff5_cond <= VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_cond;
     n16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue;
     n16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output := n16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c7_df6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l665_c7_f97e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_return_output := result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l659_c7_df6b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_cond;
     tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output := tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c7_df6b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_cff5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l665_c7_f97e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_f97e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l659_c7_df6b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_return_output := result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_cff5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l659_c7_df6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l655_c7_cff5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_cond;
     tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output := tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l659_c7_df6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;

     -- n16_MUX[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond <= VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond;
     n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue;
     n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output := n16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l655_c7_cff5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_df6b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_cff5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l655_c7_cff5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_cond;
     tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output := tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l655_c7_cff5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_return_output := result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_cff5_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output := result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l647_c2_2b4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l711_l643_DUPLICATE_85db LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l711_l643_DUPLICATE_85db_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_81ab(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_2b4f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l711_l643_DUPLICATE_85db_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_81ab_uxn_opcodes_h_l711_l643_DUPLICATE_85db_return_output;
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
