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
-- Submodules: 99
entity jsr2_0CLK_e5fcbde3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_e5fcbde3;
architecture arch of jsr2_0CLK_e5fcbde3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l814_c6_44ee]
signal BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l814_c1_130e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l814_c2_fc7a]
signal t16_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l814_c2_fc7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l814_c2_fc7a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l814_c2_fc7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l814_c2_fc7a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l814_c2_fc7a]
signal result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l814_c2_fc7a]
signal result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l814_c2_fc7a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l814_c2_fc7a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l814_c2_fc7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l815_c3_b3c1[uxn_opcodes_h_l815_c3_b3c1]
signal printf_uxn_opcodes_h_l815_c3_b3c1_uxn_opcodes_h_l815_c3_b3c1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l819_c11_1fb7]
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l819_c7_865b]
signal t16_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l819_c7_865b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l819_c7_865b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c7_865b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c7_865b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l819_c7_865b]
signal result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l819_c7_865b]
signal result_pc_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c7_865b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l819_c7_865b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l819_c7_865b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l822_c11_f8a5]
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l822_c7_87bf]
signal t16_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_87bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l822_c7_87bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l822_c7_87bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l822_c7_87bf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l822_c7_87bf]
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l822_c7_87bf]
signal result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l822_c7_87bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l822_c7_87bf]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_87bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l824_c3_f472]
signal CONST_SL_8_uxn_opcodes_h_l824_c3_f472_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l824_c3_f472_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l827_c11_e1b8]
signal BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l827_c7_c141]
signal t16_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l827_c7_c141]
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l827_c7_c141]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l827_c7_c141]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l827_c7_c141]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l827_c7_c141]
signal result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l827_c7_c141]
signal result_pc_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l827_c7_c141]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l827_c7_c141]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l827_c7_c141]
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l830_c11_d5c1]
signal BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l830_c7_56f8]
signal t16_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l830_c7_56f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c7_56f8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c7_56f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l830_c7_56f8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l830_c7_56f8]
signal result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l830_c7_56f8]
signal result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c7_56f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l830_c7_56f8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l830_c7_56f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l831_c3_91ea]
signal BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l833_c32_e064]
signal BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l833_c32_ee02]
signal BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l833_c32_7abd]
signal MUX_uxn_opcodes_h_l833_c32_7abd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l833_c32_7abd_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l833_c32_7abd_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l833_c32_7abd_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l835_c11_dd0d]
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_93ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_93ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_93ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c7_93ae]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l835_c7_93ae]
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l835_c7_93ae]
signal result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_93ae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : signed(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c7_93ae]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_93ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l839_c11_7bd7]
signal BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l839_c7_2cde]
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l839_c7_2cde]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l839_c7_2cde]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l839_c7_2cde]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l839_c7_2cde]
signal result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l839_c7_2cde]
signal result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l839_c7_2cde]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l839_c7_2cde]
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l845_c11_d2d2]
signal BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l845_c7_33d9]
signal result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l845_c7_33d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l845_c7_33d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l845_c7_33d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l845_c7_33d9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l845_c7_33d9]
signal result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l845_c7_33d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l847_c34_1c5e]
signal CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l851_c11_a95e]
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l851_c7_41dd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l851_c7_41dd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_41dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_41dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7246( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.pc := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee
BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_left,
BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_right,
BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_return_output);

-- t16_MUX_uxn_opcodes_h_l814_c2_fc7a
t16_MUX_uxn_opcodes_h_l814_c2_fc7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l814_c2_fc7a_cond,
t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue,
t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse,
t16_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a
result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a
result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_cond,
result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a
result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_cond,
result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue,
result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse,
result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a
result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a
result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output);

-- printf_uxn_opcodes_h_l815_c3_b3c1_uxn_opcodes_h_l815_c3_b3c1
printf_uxn_opcodes_h_l815_c3_b3c1_uxn_opcodes_h_l815_c3_b3c1 : entity work.printf_uxn_opcodes_h_l815_c3_b3c1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l815_c3_b3c1_uxn_opcodes_h_l815_c3_b3c1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7
BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_left,
BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_right,
BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output);

-- t16_MUX_uxn_opcodes_h_l819_c7_865b
t16_MUX_uxn_opcodes_h_l819_c7_865b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l819_c7_865b_cond,
t16_MUX_uxn_opcodes_h_l819_c7_865b_iftrue,
t16_MUX_uxn_opcodes_h_l819_c7_865b_iffalse,
t16_MUX_uxn_opcodes_h_l819_c7_865b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b
result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b
result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b
result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_cond,
result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l819_c7_865b
result_pc_MUX_uxn_opcodes_h_l819_c7_865b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l819_c7_865b_cond,
result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iftrue,
result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iffalse,
result_pc_MUX_uxn_opcodes_h_l819_c7_865b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5
BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_left,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_right,
BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output);

-- t16_MUX_uxn_opcodes_h_l822_c7_87bf
t16_MUX_uxn_opcodes_h_l822_c7_87bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l822_c7_87bf_cond,
t16_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue,
t16_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse,
t16_MUX_uxn_opcodes_h_l822_c7_87bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf
result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_cond,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_return_output);

-- result_pc_MUX_uxn_opcodes_h_l822_c7_87bf
result_pc_MUX_uxn_opcodes_h_l822_c7_87bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_cond,
result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue,
result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse,
result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_return_output);

-- CONST_SL_8_uxn_opcodes_h_l824_c3_f472
CONST_SL_8_uxn_opcodes_h_l824_c3_f472 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l824_c3_f472_x,
CONST_SL_8_uxn_opcodes_h_l824_c3_f472_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8
BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_left,
BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_right,
BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output);

-- t16_MUX_uxn_opcodes_h_l827_c7_c141
t16_MUX_uxn_opcodes_h_l827_c7_c141 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l827_c7_c141_cond,
t16_MUX_uxn_opcodes_h_l827_c7_c141_iftrue,
t16_MUX_uxn_opcodes_h_l827_c7_c141_iffalse,
t16_MUX_uxn_opcodes_h_l827_c7_c141_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141
result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141
result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_cond,
result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_return_output);

-- result_pc_MUX_uxn_opcodes_h_l827_c7_c141
result_pc_MUX_uxn_opcodes_h_l827_c7_c141 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l827_c7_c141_cond,
result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iftrue,
result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iffalse,
result_pc_MUX_uxn_opcodes_h_l827_c7_c141_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1
BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_left,
BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_right,
BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output);

-- t16_MUX_uxn_opcodes_h_l830_c7_56f8
t16_MUX_uxn_opcodes_h_l830_c7_56f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l830_c7_56f8_cond,
t16_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue,
t16_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse,
t16_MUX_uxn_opcodes_h_l830_c7_56f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8
result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8
result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_cond,
result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l830_c7_56f8
result_pc_MUX_uxn_opcodes_h_l830_c7_56f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_cond,
result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue,
result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse,
result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea
BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_left,
BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_right,
BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l833_c32_e064
BIN_OP_AND_uxn_opcodes_h_l833_c32_e064 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_left,
BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_right,
BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02
BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_left,
BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_right,
BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_return_output);

-- MUX_uxn_opcodes_h_l833_c32_7abd
MUX_uxn_opcodes_h_l833_c32_7abd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l833_c32_7abd_cond,
MUX_uxn_opcodes_h_l833_c32_7abd_iftrue,
MUX_uxn_opcodes_h_l833_c32_7abd_iffalse,
MUX_uxn_opcodes_h_l833_c32_7abd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d
BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_left,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_right,
BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae
result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_cond,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_return_output);

-- result_pc_MUX_uxn_opcodes_h_l835_c7_93ae
result_pc_MUX_uxn_opcodes_h_l835_c7_93ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_cond,
result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue,
result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse,
result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7
BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_left,
BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_right,
BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde
result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde
result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_cond,
result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_return_output);

-- result_pc_MUX_uxn_opcodes_h_l839_c7_2cde
result_pc_MUX_uxn_opcodes_h_l839_c7_2cde : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_cond,
result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue,
result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse,
result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2
BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_left,
BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_right,
BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l845_c7_33d9
result_pc_MUX_uxn_opcodes_h_l845_c7_33d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_cond,
result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue,
result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse,
result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9
result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e
CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_x,
CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e
BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_left,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_right,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd
result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_return_output,
 t16_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
 result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output,
 t16_MUX_uxn_opcodes_h_l819_c7_865b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_return_output,
 result_pc_MUX_uxn_opcodes_h_l819_c7_865b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output,
 t16_MUX_uxn_opcodes_h_l822_c7_87bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_return_output,
 result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_return_output,
 CONST_SL_8_uxn_opcodes_h_l824_c3_f472_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output,
 t16_MUX_uxn_opcodes_h_l827_c7_c141_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_return_output,
 result_pc_MUX_uxn_opcodes_h_l827_c7_c141_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output,
 t16_MUX_uxn_opcodes_h_l830_c7_56f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_return_output,
 result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_return_output,
 BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_return_output,
 BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_return_output,
 MUX_uxn_opcodes_h_l833_c32_7abd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_return_output,
 result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_return_output,
 result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output,
 result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_return_output,
 CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_4437 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l815_c3_b3c1_uxn_opcodes_h_l815_c3_b3c1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l820_c3_b44f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l825_c3_6b1a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_f472_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_f472_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_9bf5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l833_c32_7abd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l833_c32_7abd_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l833_c32_7abd_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l833_c32_7abd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l837_c3_05ad : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_146c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l843_c24_0c4b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_c693 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l847_c24_f845_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l814_DUPLICATE_f2e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_l839_DUPLICATE_c65f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l814_l839_DUPLICATE_ed1c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_DUPLICATE_0adf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_l839_DUPLICATE_0007_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_DUPLICATE_bb54_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l830_l827_l822_l851_l819_l845_l814_l839_DUPLICATE_aeb7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l839_DUPLICATE_18ae_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l831_l823_DUPLICATE_b0ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_4665_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7246_uxn_opcodes_h_l858_l810_DUPLICATE_a27b_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_c693 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l846_c3_c693;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l833_c32_7abd_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_right := to_unsigned(7, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_146c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l842_c3_146c;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l837_c3_05ad := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l837_c3_05ad;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_9bf5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l828_c3_9bf5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_4437 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l816_c3_4437;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l825_c3_6b1a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l825_c3_6b1a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l833_c32_7abd_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l820_c3_b44f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l820_c3_b44f;

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_left := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_l839_DUPLICATE_c65f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_l839_DUPLICATE_c65f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l839_DUPLICATE_18ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l839_DUPLICATE_18ae_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_l839_DUPLICATE_0007 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_l839_DUPLICATE_0007_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l814_DUPLICATE_f2e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l814_DUPLICATE_f2e6_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l822_c11_f8a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l851_c11_a95e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_left;
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_return_output := BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_DUPLICATE_bb54 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_DUPLICATE_bb54_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l830_l827_l822_l851_l819_l845_l814_l839_DUPLICATE_aeb7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l830_l827_l822_l851_l819_l845_l814_l839_DUPLICATE_aeb7_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l827_c11_e1b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l814_l839_DUPLICATE_ed1c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l814_l839_DUPLICATE_ed1c_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l819_c11_1fb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l833_c32_e064] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_left;
     BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_return_output := BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l843_c24_0c4b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l843_c24_0c4b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_DUPLICATE_0adf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_DUPLICATE_0adf_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l830_c11_d5c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l814_c6_44ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l839_c11_7bd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_4665 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_4665_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l835_c11_dd0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l831_l823_DUPLICATE_b0ed LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l831_l823_DUPLICATE_b0ed_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l845_c11_d2d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l847_c34_1c5e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_return_output := CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_left := VAR_BIN_OP_AND_uxn_opcodes_h_l833_c32_e064_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l814_c6_44ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l819_c11_1fb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l822_c11_f8a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l827_c11_e1b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l830_c11_d5c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l835_c11_dd0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l839_c11_7bd7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l845_c11_d2d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_a95e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l831_l823_DUPLICATE_b0ed_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_f472_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l831_l823_DUPLICATE_b0ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l843_c24_0c4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_DUPLICATE_bb54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_DUPLICATE_bb54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_DUPLICATE_bb54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_DUPLICATE_bb54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_DUPLICATE_bb54_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_l839_DUPLICATE_0007_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_l839_DUPLICATE_0007_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_l839_DUPLICATE_0007_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_l839_DUPLICATE_0007_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_l839_DUPLICATE_0007_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_l839_DUPLICATE_0007_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_l839_DUPLICATE_0007_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_l839_DUPLICATE_0007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l839_DUPLICATE_18ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l839_DUPLICATE_18ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l839_DUPLICATE_18ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l839_DUPLICATE_18ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l839_DUPLICATE_18ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l839_DUPLICATE_18ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l839_DUPLICATE_18ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l839_DUPLICATE_18ae_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l814_l839_DUPLICATE_ed1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l814_l839_DUPLICATE_ed1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l814_l839_DUPLICATE_ed1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l814_l839_DUPLICATE_ed1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l814_l839_DUPLICATE_ed1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l814_l839_DUPLICATE_ed1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l814_l839_DUPLICATE_ed1c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l814_l839_DUPLICATE_ed1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_l839_DUPLICATE_c65f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_l839_DUPLICATE_c65f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_l839_DUPLICATE_c65f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_l839_DUPLICATE_c65f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_l839_DUPLICATE_c65f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l835_l827_l822_l819_l814_l839_DUPLICATE_c65f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l830_l827_l822_l851_l819_l845_l814_l839_DUPLICATE_aeb7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l830_l827_l822_l851_l819_l845_l814_l839_DUPLICATE_aeb7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l830_l827_l822_l851_l819_l845_l814_l839_DUPLICATE_aeb7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l830_l827_l822_l851_l819_l845_l814_l839_DUPLICATE_aeb7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l830_l827_l822_l851_l819_l845_l814_l839_DUPLICATE_aeb7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l830_l827_l822_l851_l819_l845_l814_l839_DUPLICATE_aeb7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l830_l827_l822_l851_l819_l845_l814_l839_DUPLICATE_aeb7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l830_l827_l822_l851_l819_l845_l814_l839_DUPLICATE_aeb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l814_DUPLICATE_f2e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l814_DUPLICATE_f2e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l814_DUPLICATE_f2e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l814_DUPLICATE_f2e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l814_DUPLICATE_f2e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l814_DUPLICATE_f2e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l814_DUPLICATE_f2e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l835_l830_l827_l822_l851_l819_l845_l814_DUPLICATE_f2e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_4665_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_4665_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l830_l845_l835_DUPLICATE_4665_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_DUPLICATE_0adf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_DUPLICATE_0adf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_DUPLICATE_0adf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_DUPLICATE_0adf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_DUPLICATE_0adf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_DUPLICATE_0adf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l835_l830_l827_l822_l819_l845_l814_DUPLICATE_0adf_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l833_c32_ee02] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_left;
     BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_return_output := BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_41dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l851_c7_41dd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l814_c1_130e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l847_c24_f845] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l847_c24_f845_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l847_c34_1c5e_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l851_c7_41dd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l845_c7_33d9] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_cond;
     result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue;
     result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_return_output := result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l831_c3_91ea] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_left;
     BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_return_output := BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l839_c7_2cde] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l845_c7_33d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_41dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l835_c7_93ae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l824_c3_f472] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l824_c3_f472_x <= VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_f472_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_f472_return_output := CONST_SL_8_uxn_opcodes_h_l824_c3_f472_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l833_c32_7abd_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l833_c32_ee02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l831_c3_91ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l847_c24_f845_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l824_c3_f472_return_output;
     VAR_printf_uxn_opcodes_h_l815_c3_b3c1_uxn_opcodes_h_l815_c3_b3c1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l814_c1_130e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_41dd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l851_c7_41dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l851_c7_41dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_41dd_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;
     -- t16_MUX[uxn_opcodes_h_l830_c7_56f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l830_c7_56f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_cond;
     t16_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue;
     t16_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_return_output := t16_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;

     -- printf_uxn_opcodes_h_l815_c3_b3c1[uxn_opcodes_h_l815_c3_b3c1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l815_c3_b3c1_uxn_opcodes_h_l815_c3_b3c1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l815_c3_b3c1_uxn_opcodes_h_l815_c3_b3c1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l845_c7_33d9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l839_c7_2cde] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_cond;
     result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue;
     result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_return_output := result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l845_c7_33d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l845_c7_33d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;

     -- MUX[uxn_opcodes_h_l833_c32_7abd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l833_c32_7abd_cond <= VAR_MUX_uxn_opcodes_h_l833_c32_7abd_cond;
     MUX_uxn_opcodes_h_l833_c32_7abd_iftrue <= VAR_MUX_uxn_opcodes_h_l833_c32_7abd_iftrue;
     MUX_uxn_opcodes_h_l833_c32_7abd_iffalse <= VAR_MUX_uxn_opcodes_h_l833_c32_7abd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l833_c32_7abd_return_output := MUX_uxn_opcodes_h_l833_c32_7abd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l839_c7_2cde] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l845_c7_33d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l845_c7_33d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l835_c7_93ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue := VAR_MUX_uxn_opcodes_h_l833_c32_7abd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l845_c7_33d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_iffalse := VAR_t16_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l835_c7_93ae] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_cond;
     result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue;
     result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_return_output := result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l839_c7_2cde] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l830_c7_56f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l835_c7_93ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l839_c7_2cde] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l830_c7_56f8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l839_c7_2cde] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l839_c7_2cde] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_cond;
     result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_return_output := result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l839_c7_2cde] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;

     -- t16_MUX[uxn_opcodes_h_l827_c7_c141] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l827_c7_c141_cond <= VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_cond;
     t16_MUX_uxn_opcodes_h_l827_c7_c141_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_iftrue;
     t16_MUX_uxn_opcodes_h_l827_c7_c141_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_return_output := t16_MUX_uxn_opcodes_h_l827_c7_c141_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l839_c7_2cde_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l827_c7_c141_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l830_c7_56f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l830_c7_56f8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_cond;
     result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_return_output := result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l835_c7_93ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l835_c7_93ae] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l835_c7_93ae] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l827_c7_c141] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l827_c7_c141] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l835_c7_93ae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_return_output := result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l835_c7_93ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;

     -- t16_MUX[uxn_opcodes_h_l822_c7_87bf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l822_c7_87bf_cond <= VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_cond;
     t16_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue;
     t16_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_return_output := t16_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l827_c7_c141_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l835_c7_93ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l822_c7_87bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l830_c7_56f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l830_c7_56f8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_return_output := result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l830_c7_56f8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l830_c7_56f8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l822_c7_87bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l827_c7_c141] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l827_c7_c141_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_cond;
     result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iftrue;
     result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_return_output := result_pc_MUX_uxn_opcodes_h_l827_c7_c141_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l830_c7_56f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;

     -- t16_MUX[uxn_opcodes_h_l819_c7_865b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l819_c7_865b_cond <= VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_cond;
     t16_MUX_uxn_opcodes_h_l819_c7_865b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_iftrue;
     t16_MUX_uxn_opcodes_h_l819_c7_865b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_return_output := t16_MUX_uxn_opcodes_h_l819_c7_865b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l827_c7_c141] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l827_c7_c141_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l827_c7_c141_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l830_c7_56f8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l819_c7_865b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l819_c7_865b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l827_c7_c141] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l822_c7_87bf] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_cond;
     result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue;
     result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_return_output := result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l827_c7_c141] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l822_c7_87bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l827_c7_c141] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l819_c7_865b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l827_c7_c141] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_cond;
     result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_return_output := result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_return_output;

     -- t16_MUX[uxn_opcodes_h_l814_c2_fc7a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l814_c2_fc7a_cond <= VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_cond;
     t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue;
     t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output := t16_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l827_c7_c141] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l827_c7_c141_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l827_c7_c141_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l827_c7_c141_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l827_c7_c141_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l819_c7_865b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l827_c7_c141_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l822_c7_87bf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l814_c2_fc7a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l819_c7_865b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l819_c7_865b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_cond;
     result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_return_output := result_pc_MUX_uxn_opcodes_h_l819_c7_865b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l822_c7_87bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l822_c7_87bf] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l819_c7_865b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l814_c2_fc7a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l822_c7_87bf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_return_output := result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l822_c7_87bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l819_c7_865b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l819_c7_865b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l822_c7_87bf_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l819_c7_865b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l819_c7_865b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l814_c2_fc7a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_cond;
     result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output := result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l814_c2_fc7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l819_c7_865b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l819_c7_865b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_return_output := result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l819_c7_865b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l819_c7_865b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l819_c7_865b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l819_c7_865b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l819_c7_865b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l819_c7_865b_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l814_c2_fc7a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l814_c2_fc7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l814_c2_fc7a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output := result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l814_c2_fc7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l814_c2_fc7a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7246_uxn_opcodes_h_l858_l810_DUPLICATE_a27b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7246_uxn_opcodes_h_l858_l810_DUPLICATE_a27b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7246(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l814_c2_fc7a_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7246_uxn_opcodes_h_l858_l810_DUPLICATE_a27b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7246_uxn_opcodes_h_l858_l810_DUPLICATE_a27b_return_output;
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
