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
-- Submodules: 109
entity jsr2_0CLK_a538d920 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_a538d920;
architecture arch of jsr2_0CLK_a538d920 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l633_c6_cf6e]
signal BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l633_c1_285b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l633_c2_d886]
signal t16_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l633_c2_d886]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l633_c2_d886]
signal result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l633_c2_d886]
signal result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l633_c2_d886]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l633_c2_d886]
signal result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l633_c2_d886]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l633_c2_d886]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l633_c2_d886]
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l633_c2_d886]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l633_c2_d886]
signal result_pc_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l634_c3_4426[uxn_opcodes_h_l634_c3_4426]
signal printf_uxn_opcodes_h_l634_c3_4426_uxn_opcodes_h_l634_c3_4426_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l639_c11_b4e0]
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l639_c7_f450]
signal t16_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l639_c7_f450]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l639_c7_f450]
signal result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l639_c7_f450]
signal result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l639_c7_f450]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l639_c7_f450]
signal result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l639_c7_f450]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l639_c7_f450]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_f450]
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l639_c7_f450]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l639_c7_f450]
signal result_pc_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l642_c11_d768]
signal BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l642_c7_54d5]
signal t16_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l642_c7_54d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l642_c7_54d5]
signal result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l642_c7_54d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l642_c7_54d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l642_c7_54d5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l642_c7_54d5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l642_c7_54d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l642_c7_54d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l642_c7_54d5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l642_c7_54d5]
signal result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l644_c3_e78e]
signal CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l647_c11_1c39]
signal BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l647_c7_441e]
signal t16_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l647_c7_441e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l647_c7_441e]
signal result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l647_c7_441e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l647_c7_441e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l647_c7_441e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l647_c7_441e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l647_c7_441e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l647_c7_441e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l647_c7_441e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l647_c7_441e]
signal result_pc_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l650_c11_ab2b]
signal BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l650_c7_1577]
signal t16_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l650_c7_1577]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l650_c7_1577]
signal result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l650_c7_1577]
signal result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l650_c7_1577]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l650_c7_1577]
signal result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l650_c7_1577]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l650_c7_1577]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l650_c7_1577]
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l650_c7_1577]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l650_c7_1577]
signal result_pc_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l651_c3_42db]
signal BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l654_c32_a341]
signal BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l654_c32_c08a]
signal BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l654_c32_0ab5]
signal MUX_uxn_opcodes_h_l654_c32_0ab5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l654_c32_0ab5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l654_c32_0ab5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l654_c32_0ab5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l656_c11_9c69]
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l656_c7_3dba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l656_c7_3dba]
signal result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l656_c7_3dba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l656_c7_3dba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l656_c7_3dba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l656_c7_3dba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l656_c7_3dba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l656_c7_3dba]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l656_c7_3dba]
signal result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l660_c11_5f16]
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l660_c7_e770]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l660_c7_e770]
signal result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l660_c7_e770]
signal result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l660_c7_e770]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_e770]
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l660_c7_e770]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l660_c7_e770]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l660_c7_e770]
signal result_pc_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l666_c11_2d4a]
signal BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l666_c7_cf63]
signal result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l666_c7_cf63]
signal result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l666_c7_cf63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l666_c7_cf63]
signal result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l666_c7_cf63]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l666_c7_cf63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l666_c7_cf63]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l668_c34_6f2b]
signal CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l670_c11_314c]
signal BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l670_c7_a65e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l670_c7_a65e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l670_c7_a65e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l670_c7_a65e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l670_c7_a65e]
signal result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l675_c11_4997]
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l675_c7_903d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l675_c7_903d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c7_903d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_095e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.pc := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e
BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_left,
BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_right,
BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_return_output);

-- t16_MUX_uxn_opcodes_h_l633_c2_d886
t16_MUX_uxn_opcodes_h_l633_c2_d886 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l633_c2_d886_cond,
t16_MUX_uxn_opcodes_h_l633_c2_d886_iftrue,
t16_MUX_uxn_opcodes_h_l633_c2_d886_iffalse,
t16_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886
result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_cond,
result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886
result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886
result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886
result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

-- result_pc_MUX_uxn_opcodes_h_l633_c2_d886
result_pc_MUX_uxn_opcodes_h_l633_c2_d886 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l633_c2_d886_cond,
result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iftrue,
result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iffalse,
result_pc_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

-- printf_uxn_opcodes_h_l634_c3_4426_uxn_opcodes_h_l634_c3_4426
printf_uxn_opcodes_h_l634_c3_4426_uxn_opcodes_h_l634_c3_4426 : entity work.printf_uxn_opcodes_h_l634_c3_4426_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l634_c3_4426_uxn_opcodes_h_l634_c3_4426_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0
BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_left,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_right,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output);

-- t16_MUX_uxn_opcodes_h_l639_c7_f450
t16_MUX_uxn_opcodes_h_l639_c7_f450 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l639_c7_f450_cond,
t16_MUX_uxn_opcodes_h_l639_c7_f450_iftrue,
t16_MUX_uxn_opcodes_h_l639_c7_f450_iffalse,
t16_MUX_uxn_opcodes_h_l639_c7_f450_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450
result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_cond,
result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450
result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450
result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_return_output);

-- result_pc_MUX_uxn_opcodes_h_l639_c7_f450
result_pc_MUX_uxn_opcodes_h_l639_c7_f450 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l639_c7_f450_cond,
result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iftrue,
result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iffalse,
result_pc_MUX_uxn_opcodes_h_l639_c7_f450_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768
BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_left,
BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_right,
BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output);

-- t16_MUX_uxn_opcodes_h_l642_c7_54d5
t16_MUX_uxn_opcodes_h_l642_c7_54d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l642_c7_54d5_cond,
t16_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue,
t16_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse,
t16_MUX_uxn_opcodes_h_l642_c7_54d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5
result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5
result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_cond,
result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5
result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5
result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5
result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5
result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l642_c7_54d5
result_pc_MUX_uxn_opcodes_h_l642_c7_54d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_cond,
result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue,
result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse,
result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l644_c3_e78e
CONST_SL_8_uxn_opcodes_h_l644_c3_e78e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_x,
CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39
BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_left,
BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_right,
BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output);

-- t16_MUX_uxn_opcodes_h_l647_c7_441e
t16_MUX_uxn_opcodes_h_l647_c7_441e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l647_c7_441e_cond,
t16_MUX_uxn_opcodes_h_l647_c7_441e_iftrue,
t16_MUX_uxn_opcodes_h_l647_c7_441e_iffalse,
t16_MUX_uxn_opcodes_h_l647_c7_441e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e
result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_cond,
result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e
result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e
result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e
result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e
result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l647_c7_441e
result_pc_MUX_uxn_opcodes_h_l647_c7_441e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l647_c7_441e_cond,
result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iftrue,
result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iffalse,
result_pc_MUX_uxn_opcodes_h_l647_c7_441e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b
BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_left,
BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_right,
BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output);

-- t16_MUX_uxn_opcodes_h_l650_c7_1577
t16_MUX_uxn_opcodes_h_l650_c7_1577 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l650_c7_1577_cond,
t16_MUX_uxn_opcodes_h_l650_c7_1577_iftrue,
t16_MUX_uxn_opcodes_h_l650_c7_1577_iffalse,
t16_MUX_uxn_opcodes_h_l650_c7_1577_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577
result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577
result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_cond,
result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577
result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577
result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577
result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_return_output);

-- result_pc_MUX_uxn_opcodes_h_l650_c7_1577
result_pc_MUX_uxn_opcodes_h_l650_c7_1577 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l650_c7_1577_cond,
result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iftrue,
result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iffalse,
result_pc_MUX_uxn_opcodes_h_l650_c7_1577_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l651_c3_42db
BIN_OP_OR_uxn_opcodes_h_l651_c3_42db : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_left,
BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_right,
BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l654_c32_a341
BIN_OP_AND_uxn_opcodes_h_l654_c32_a341 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_left,
BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_right,
BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a
BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_left,
BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_right,
BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_return_output);

-- MUX_uxn_opcodes_h_l654_c32_0ab5
MUX_uxn_opcodes_h_l654_c32_0ab5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l654_c32_0ab5_cond,
MUX_uxn_opcodes_h_l654_c32_0ab5_iftrue,
MUX_uxn_opcodes_h_l654_c32_0ab5_iffalse,
MUX_uxn_opcodes_h_l654_c32_0ab5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69
BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_left,
BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_right,
BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba
result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_cond,
result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba
result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_return_output);

-- result_pc_MUX_uxn_opcodes_h_l656_c7_3dba
result_pc_MUX_uxn_opcodes_h_l656_c7_3dba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_cond,
result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue,
result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse,
result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16
BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_left,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_right,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770
result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770
result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_cond,
result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770
result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_return_output);

-- result_pc_MUX_uxn_opcodes_h_l660_c7_e770
result_pc_MUX_uxn_opcodes_h_l660_c7_e770 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l660_c7_e770_cond,
result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iftrue,
result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iffalse,
result_pc_MUX_uxn_opcodes_h_l660_c7_e770_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a
BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_left,
BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_right,
BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l666_c7_cf63
result_pc_MUX_uxn_opcodes_h_l666_c7_cf63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_cond,
result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue,
result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse,
result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63
result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_cond,
result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63
result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63
result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63
result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_return_output);

-- CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b
CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_x,
CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c
BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_left,
BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_right,
BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e
result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e
result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l670_c7_a65e
result_pc_MUX_uxn_opcodes_h_l670_c7_a65e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_cond,
result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue,
result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse,
result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997
BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_left,
BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_right,
BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_return_output,
 t16_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
 result_pc_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output,
 t16_MUX_uxn_opcodes_h_l639_c7_f450_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_return_output,
 result_pc_MUX_uxn_opcodes_h_l639_c7_f450_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output,
 t16_MUX_uxn_opcodes_h_l642_c7_54d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_return_output,
 result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_return_output,
 CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output,
 t16_MUX_uxn_opcodes_h_l647_c7_441e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_return_output,
 result_pc_MUX_uxn_opcodes_h_l647_c7_441e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output,
 t16_MUX_uxn_opcodes_h_l650_c7_1577_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_return_output,
 result_pc_MUX_uxn_opcodes_h_l650_c7_1577_return_output,
 BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_return_output,
 BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_return_output,
 BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_return_output,
 MUX_uxn_opcodes_h_l654_c32_0ab5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_return_output,
 result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_return_output,
 result_pc_MUX_uxn_opcodes_h_l660_c7_e770_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output,
 result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_return_output,
 CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_return_output,
 result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l636_c3_2323 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l634_c3_4426_uxn_opcodes_h_l634_c3_4426_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l640_c3_cc9c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l645_c3_67fa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l648_c3_ad9a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l658_c3_5766 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_13d5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l664_c24_b550_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_3492 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l668_c24_e670_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l660_DUPLICATE_ccc4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l650_DUPLICATE_e619_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l650_DUPLICATE_0247_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_DUPLICATE_6679_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l639_l647_l642_l650_DUPLICATE_f4ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l643_l651_DUPLICATE_246f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l666_l656_l650_DUPLICATE_f4af_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_095e_uxn_opcodes_h_l681_l629_DUPLICATE_689d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l645_c3_67fa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l645_c3_67fa;
     VAR_BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l636_c3_2323 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l636_c3_2323;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_3492 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_3492;
     VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_iffalse := resize(to_signed(-2, 3), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iffalse := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l658_c3_5766 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l658_c3_5766;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l640_c3_cc9c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l640_c3_cc9c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l648_c3_ad9a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l648_c3_ad9a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_right := to_unsigned(8, 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_13d5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_13d5;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_x := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l660_c11_5f16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_left;
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output := BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l650_c11_ab2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l675_c11_4997] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_left;
     BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_return_output := BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_DUPLICATE_6679 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_DUPLICATE_6679_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l639_l647_l642_l650_DUPLICATE_f4ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l639_l647_l642_l650_DUPLICATE_f4ec_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l666_c11_2d4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l668_c34_6f2b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_return_output := CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l664_c24_b550] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l664_c24_b550_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l650_DUPLICATE_0247 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l650_DUPLICATE_0247_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l650_DUPLICATE_e619 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l650_DUPLICATE_e619_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l656_c11_9c69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_left;
     BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output := BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l647_c11_1c39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_left;
     BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output := BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l643_l651_DUPLICATE_246f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l643_l651_DUPLICATE_246f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_AND[uxn_opcodes_h_l654_c32_a341] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_left;
     BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_return_output := BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l666_l656_l650_DUPLICATE_f4af LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l666_l656_l650_DUPLICATE_f4af_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l660_DUPLICATE_ccc4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l660_DUPLICATE_ccc4_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l639_c11_b4e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l642_c11_d768] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_left;
     BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output := BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l670_c11_314c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_left;
     BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_return_output := BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l633_c6_cf6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l654_c32_a341_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c6_cf6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_b4e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l642_c11_d768_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c11_1c39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c11_ab2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l656_c11_9c69_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_5f16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c11_2d4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_314c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l675_c11_4997_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l643_l651_DUPLICATE_246f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l643_l651_DUPLICATE_246f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l664_c24_b550_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_DUPLICATE_6679_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_DUPLICATE_6679_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_DUPLICATE_6679_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_DUPLICATE_6679_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_DUPLICATE_6679_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l660_l650_DUPLICATE_837e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l656_l647_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_7578_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l675_l660_l650_DUPLICATE_c433_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l660_DUPLICATE_ccc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l660_DUPLICATE_ccc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l660_DUPLICATE_ccc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l660_DUPLICATE_ccc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l660_DUPLICATE_ccc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l660_DUPLICATE_ccc4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_l633_l639_l642_l666_l675_l670_l660_l650_DUPLICATE_edf6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l639_l647_l642_l650_DUPLICATE_f4ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l639_l647_l642_l650_DUPLICATE_f4ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l639_l647_l642_l650_DUPLICATE_f4ec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l639_l647_l642_l650_DUPLICATE_f4ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l650_DUPLICATE_0247_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l650_DUPLICATE_0247_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l650_DUPLICATE_0247_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l650_DUPLICATE_0247_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l650_DUPLICATE_0247_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l650_DUPLICATE_0247_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l650_DUPLICATE_0247_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l670_l650_DUPLICATE_0247_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l666_l656_l650_DUPLICATE_f4af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l666_l656_l650_DUPLICATE_f4af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l666_l656_l650_DUPLICATE_f4af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l650_DUPLICATE_e619_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l650_DUPLICATE_e619_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l650_DUPLICATE_e619_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l650_DUPLICATE_e619_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l650_DUPLICATE_e619_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l650_DUPLICATE_e619_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l656_l647_l633_l639_l642_l666_l650_DUPLICATE_e619_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l660_c7_e770] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l633_c1_285b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l675_c7_903d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l675_c7_903d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l668_c24_e670] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l668_c24_e670_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l668_c34_6f2b_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l654_c32_c08a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_left;
     BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_return_output := BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l675_c7_903d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l670_c7_a65e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l650_c7_1577] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l651_c3_42db] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_left;
     BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_return_output := BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l666_c7_cf63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l656_c7_3dba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l670_c7_a65e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_cond;
     result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_return_output := result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l644_c3_e78e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_return_output := CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l654_c32_c08a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l651_c3_42db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l668_c24_e670_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l644_c3_e78e_return_output;
     VAR_printf_uxn_opcodes_h_l634_c3_4426_uxn_opcodes_h_l634_c3_4426_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l633_c1_285b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l675_c7_903d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l675_c7_903d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l660_c7_e770_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l675_c7_903d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l650_c7_1577_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l670_c7_a65e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l670_c7_a65e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;
     -- MUX[uxn_opcodes_h_l654_c32_0ab5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l654_c32_0ab5_cond <= VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_cond;
     MUX_uxn_opcodes_h_l654_c32_0ab5_iftrue <= VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_iftrue;
     MUX_uxn_opcodes_h_l654_c32_0ab5_iffalse <= VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_return_output := MUX_uxn_opcodes_h_l654_c32_0ab5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l670_c7_a65e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l647_c7_441e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l666_c7_cf63] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l660_c7_e770] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l670_c7_a65e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l656_c7_3dba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;

     -- t16_MUX[uxn_opcodes_h_l650_c7_1577] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l650_c7_1577_cond <= VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_cond;
     t16_MUX_uxn_opcodes_h_l650_c7_1577_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_iftrue;
     t16_MUX_uxn_opcodes_h_l650_c7_1577_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_return_output := t16_MUX_uxn_opcodes_h_l650_c7_1577_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l666_c7_cf63] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_cond;
     result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_return_output := result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l670_c7_a65e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_return_output;

     -- printf_uxn_opcodes_h_l634_c3_4426[uxn_opcodes_h_l634_c3_4426] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l634_c3_4426_uxn_opcodes_h_l634_c3_4426_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l634_c3_4426_uxn_opcodes_h_l634_c3_4426_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_pc_MUX[uxn_opcodes_h_l666_c7_cf63] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_cond;
     result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue;
     result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_return_output := result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue := VAR_MUX_uxn_opcodes_h_l654_c32_0ab5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_a65e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_a65e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l670_c7_a65e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c7_441e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l660_c7_e770_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l650_c7_1577_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l650_c7_1577] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l660_c7_e770] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_cond;
     result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_return_output := result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l666_c7_cf63] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l660_c7_e770] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l660_c7_e770_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_cond;
     result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iftrue;
     result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_return_output := result_pc_MUX_uxn_opcodes_h_l660_c7_e770_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l666_c7_cf63] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;

     -- t16_MUX[uxn_opcodes_h_l647_c7_441e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l647_c7_441e_cond <= VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_cond;
     t16_MUX_uxn_opcodes_h_l647_c7_441e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_iftrue;
     t16_MUX_uxn_opcodes_h_l647_c7_441e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_return_output := t16_MUX_uxn_opcodes_h_l647_c7_441e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l656_c7_3dba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l666_c7_cf63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l650_c7_1577] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l660_c7_e770] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l642_c7_54d5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l666_c7_cf63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l660_c7_e770_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l660_c7_e770_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c7_1577_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l660_c7_e770_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l647_c7_441e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l650_c7_1577] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l647_c7_441e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l647_c7_441e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l639_c7_f450] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l660_c7_e770] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l656_c7_3dba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_return_output := result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_e770] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l656_c7_3dba] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_cond;
     result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue;
     result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_return_output := result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l660_c7_e770] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_return_output;

     -- t16_MUX[uxn_opcodes_h_l642_c7_54d5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l642_c7_54d5_cond <= VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_cond;
     t16_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue;
     t16_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_return_output := t16_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l656_c7_3dba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_e770_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_e770_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l660_c7_e770_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l639_c7_f450_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c7_441e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c7_1577_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_iffalse := VAR_t16_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l650_c7_1577] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_return_output;

     -- t16_MUX[uxn_opcodes_h_l639_c7_f450] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l639_c7_f450_cond <= VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_cond;
     t16_MUX_uxn_opcodes_h_l639_c7_f450_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_iftrue;
     t16_MUX_uxn_opcodes_h_l639_c7_f450_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_return_output := t16_MUX_uxn_opcodes_h_l639_c7_f450_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l650_c7_1577] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l650_c7_1577_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_cond;
     result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iftrue;
     result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_return_output := result_pc_MUX_uxn_opcodes_h_l650_c7_1577_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l647_c7_441e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l633_c2_d886] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l656_c7_3dba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l650_c7_1577] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_cond;
     result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_return_output := result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l656_c7_3dba] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l642_c7_54d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l642_c7_54d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l656_c7_3dba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l656_c7_3dba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l650_c7_1577_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l650_c7_1577_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c7_441e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l650_c7_1577_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_iffalse := VAR_t16_MUX_uxn_opcodes_h_l639_c7_f450_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l639_c7_f450] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l650_c7_1577] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l650_c7_1577] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l647_c7_441e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l647_c7_441e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_cond;
     result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_return_output := result_pc_MUX_uxn_opcodes_h_l647_c7_441e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l650_c7_1577] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l639_c7_f450] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l647_c7_441e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_return_output;

     -- t16_MUX[uxn_opcodes_h_l633_c2_d886] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l633_c2_d886_cond <= VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_cond;
     t16_MUX_uxn_opcodes_h_l633_c2_d886_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_iftrue;
     t16_MUX_uxn_opcodes_h_l633_c2_d886_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_return_output := t16_MUX_uxn_opcodes_h_l633_c2_d886_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l647_c7_441e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_return_output := result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l642_c7_54d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c7_1577_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c7_1577_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l650_c7_1577_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c7_441e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l647_c7_441e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l639_c7_f450_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c7_441e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l633_c2_d886_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l642_c7_54d5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_cond;
     result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_return_output := result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l642_c7_54d5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_return_output := result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l633_c2_d886] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l633_c2_d886] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l647_c7_441e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l647_c7_441e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l647_c7_441e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l642_c7_54d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l639_c7_f450] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c7_441e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l647_c7_441e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c7_441e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l639_c7_f450_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l642_c7_54d5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l642_c7_54d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l639_c7_f450] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_cond;
     result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_return_output := result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l639_c7_f450] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l639_c7_f450_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_cond;
     result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iftrue;
     result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_return_output := result_pc_MUX_uxn_opcodes_h_l639_c7_f450_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l633_c2_d886] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l642_c7_54d5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l639_c7_f450] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l642_c7_54d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l639_c7_f450_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l639_c7_f450_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l639_c7_f450_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l633_c2_d886] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_cond;
     result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_return_output := result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l639_c7_f450] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l633_c2_d886] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l639_c7_f450] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l633_c2_d886] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l633_c2_d886_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_cond;
     result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iftrue;
     result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_return_output := result_pc_MUX_uxn_opcodes_h_l633_c2_d886_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_f450] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_f450_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_f450_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l639_c7_f450_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l633_c2_d886] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l633_c2_d886] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l633_c2_d886] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_095e_uxn_opcodes_h_l681_l629_DUPLICATE_689d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_095e_uxn_opcodes_h_l681_l629_DUPLICATE_689d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_095e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c2_d886_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c2_d886_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_095e_uxn_opcodes_h_l681_l629_DUPLICATE_689d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_095e_uxn_opcodes_h_l681_l629_DUPLICATE_689d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
