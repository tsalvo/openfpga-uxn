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
-- Submodules: 66
entity jsr_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr_0CLK_4f993427;
architecture arch of jsr_0CLK_4f993427 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l712_c6_550b]
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l712_c1_a305]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l712_c2_8b6a]
signal t8_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l712_c2_8b6a]
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l712_c2_8b6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l712_c2_8b6a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l712_c2_8b6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l712_c2_8b6a]
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l712_c2_8b6a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l712_c2_8b6a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l712_c2_8b6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l712_c2_8b6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l713_c3_0658[uxn_opcodes_h_l713_c3_0658]
signal printf_uxn_opcodes_h_l713_c3_0658_uxn_opcodes_h_l713_c3_0658_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l717_c11_d3f9]
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l717_c7_9190]
signal t8_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l717_c7_9190]
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l717_c7_9190]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l717_c7_9190]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l717_c7_9190]
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l717_c7_9190]
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l717_c7_9190]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_9190]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_9190]
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_9190]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l720_c11_7f91]
signal BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l720_c7_fcb6]
signal t8_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l720_c7_fcb6]
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l720_c7_fcb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l720_c7_fcb6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l720_c7_fcb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l720_c7_fcb6]
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l720_c7_fcb6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l720_c7_fcb6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l720_c7_fcb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l720_c7_fcb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l723_c30_d498]
signal sp_relative_shift_uxn_opcodes_h_l723_c30_d498_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l723_c30_d498_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l723_c30_d498_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l723_c30_d498_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l725_c11_6a55]
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l725_c7_ab22]
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l725_c7_ab22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l725_c7_ab22]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l725_c7_ab22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l725_c7_ab22]
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l725_c7_ab22]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l725_c7_ab22]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_ab22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l725_c7_ab22]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l732_c11_5016]
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l732_c7_3340]
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l732_c7_3340]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l732_c7_3340]
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l732_c7_3340]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l732_c7_3340]
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l732_c7_3340]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l732_c7_3340]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l732_c7_3340]
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l735_c31_858d]
signal CONST_SR_8_uxn_opcodes_h_l735_c31_858d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l735_c31_858d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l737_c22_78c8]
signal BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l739_c11_83ea]
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l739_c7_1f53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l739_c7_1f53]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_1f53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_1f53]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b
BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_left,
BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_right,
BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_return_output);

-- t8_MUX_uxn_opcodes_h_l712_c2_8b6a
t8_MUX_uxn_opcodes_h_l712_c2_8b6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l712_c2_8b6a_cond,
t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue,
t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse,
t8_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a
result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond,
result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a
result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond,
result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output);

-- printf_uxn_opcodes_h_l713_c3_0658_uxn_opcodes_h_l713_c3_0658
printf_uxn_opcodes_h_l713_c3_0658_uxn_opcodes_h_l713_c3_0658 : entity work.printf_uxn_opcodes_h_l713_c3_0658_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l713_c3_0658_uxn_opcodes_h_l713_c3_0658_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9
BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_left,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_right,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output);

-- t8_MUX_uxn_opcodes_h_l717_c7_9190
t8_MUX_uxn_opcodes_h_l717_c7_9190 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l717_c7_9190_cond,
t8_MUX_uxn_opcodes_h_l717_c7_9190_iftrue,
t8_MUX_uxn_opcodes_h_l717_c7_9190_iffalse,
t8_MUX_uxn_opcodes_h_l717_c7_9190_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190
result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_cond,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190
result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_cond,
result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91
BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_left,
BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_right,
BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output);

-- t8_MUX_uxn_opcodes_h_l720_c7_fcb6
t8_MUX_uxn_opcodes_h_l720_c7_fcb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l720_c7_fcb6_cond,
t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue,
t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse,
t8_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6
result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond,
result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6
result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l723_c30_d498
sp_relative_shift_uxn_opcodes_h_l723_c30_d498 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l723_c30_d498_ins,
sp_relative_shift_uxn_opcodes_h_l723_c30_d498_x,
sp_relative_shift_uxn_opcodes_h_l723_c30_d498_y,
sp_relative_shift_uxn_opcodes_h_l723_c30_d498_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55
BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_left,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_right,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22
result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond,
result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22
result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond,
result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016
BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_left,
BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_right,
BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340
result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_cond,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340
result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_cond,
result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_return_output);

-- CONST_SR_8_uxn_opcodes_h_l735_c31_858d
CONST_SR_8_uxn_opcodes_h_l735_c31_858d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l735_c31_858d_x,
CONST_SR_8_uxn_opcodes_h_l735_c31_858d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_left,
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_right,
BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea
BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_left,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_right,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_return_output,
 t8_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output,
 t8_MUX_uxn_opcodes_h_l717_c7_9190_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output,
 t8_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output,
 sp_relative_shift_uxn_opcodes_h_l723_c30_d498_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_return_output,
 CONST_SR_8_uxn_opcodes_h_l735_c31_858d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_d3f1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l713_c3_0658_uxn_opcodes_h_l713_c3_0658_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_8539 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_7ffb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l727_c3_16dd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l730_c21_afb1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l737_c3_b9c2 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_7da4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_858d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_858d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l735_c21_763b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l737_c27_e1e1_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l712_l732_l725_l720_DUPLICATE_b7a2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l725_l717_l732_DUPLICATE_8ae4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_3669_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l712_l717_l732_l720_DUPLICATE_f549_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_c7cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l712_l739_l725_l720_DUPLICATE_62a3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_3cb6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l739_l732_l725_l720_DUPLICATE_1165_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_2b98_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8_uxn_opcodes_h_l746_l708_DUPLICATE_c1fd_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_7da4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_7da4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_7ffb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_7ffb;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l727_c3_16dd := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l727_c3_16dd;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_8539 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_8539;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_d3f1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_d3f1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_858d_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l712_l732_l725_l720_DUPLICATE_b7a2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l712_l732_l725_l720_DUPLICATE_b7a2_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l720_c11_7f91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_left;
     BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output := BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l717_c11_d3f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_c7cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_c7cb_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l712_l717_l732_l720_DUPLICATE_f549 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l712_l717_l732_l720_DUPLICATE_f549_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l739_l732_l725_l720_DUPLICATE_1165 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l739_l732_l725_l720_DUPLICATE_1165_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l723_c30_d498] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l723_c30_d498_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_ins;
     sp_relative_shift_uxn_opcodes_h_l723_c30_d498_x <= VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_x;
     sp_relative_shift_uxn_opcodes_h_l723_c30_d498_y <= VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_return_output := sp_relative_shift_uxn_opcodes_h_l723_c30_d498_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l725_l717_l732_DUPLICATE_8ae4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l725_l717_l732_DUPLICATE_8ae4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_2b98 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_2b98_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l712_l739_l725_l720_DUPLICATE_62a3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l712_l739_l725_l720_DUPLICATE_62a3_return_output := result.is_pc_updated;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l730_c21_afb1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l730_c21_afb1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l739_c11_83ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l735_c31_858d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l735_c31_858d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_858d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_858d_return_output := CONST_SR_8_uxn_opcodes_h_l735_c31_858d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l725_c11_6a55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_left;
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output := BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l737_c27_e1e1] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l737_c27_e1e1_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_3cb6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_3cb6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_3669 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_3669_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l712_c6_550b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_left;
     BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output := BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l732_c11_5016] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_left;
     BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output := BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l712_c6_550b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_d3f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c11_7f91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_6a55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_5016_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_83ea_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l737_c27_e1e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l730_c21_afb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_3cb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_3cb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l712_l725_l717_DUPLICATE_3cb6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l712_l732_l725_l720_DUPLICATE_b7a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l712_l732_l725_l720_DUPLICATE_b7a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l712_l732_l725_l720_DUPLICATE_b7a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l712_l732_l725_l720_DUPLICATE_b7a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l712_l732_l725_l720_DUPLICATE_b7a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l739_l732_l725_l720_DUPLICATE_1165_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l739_l732_l725_l720_DUPLICATE_1165_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l739_l732_l725_l720_DUPLICATE_1165_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l739_l732_l725_l720_DUPLICATE_1165_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l739_l732_l725_l720_DUPLICATE_1165_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l712_l739_l725_l720_DUPLICATE_62a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l712_l739_l725_l720_DUPLICATE_62a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l712_l739_l725_l720_DUPLICATE_62a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l712_l739_l725_l720_DUPLICATE_62a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l712_l739_l725_l720_DUPLICATE_62a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l725_l717_l732_DUPLICATE_8ae4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l725_l717_l732_DUPLICATE_8ae4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l725_l717_l732_DUPLICATE_8ae4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l712_l725_l717_l732_DUPLICATE_8ae4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_c7cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_c7cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_c7cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_c7cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_c7cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_3669_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_3669_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_3669_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_3669_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l717_l712_l739_l732_l720_DUPLICATE_3669_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_2b98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l732_l720_DUPLICATE_2b98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l712_l717_l732_l720_DUPLICATE_f549_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l712_l717_l732_l720_DUPLICATE_f549_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l712_l717_l732_l720_DUPLICATE_f549_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l712_l717_l732_l720_DUPLICATE_f549_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l723_c30_d498_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l725_c7_ab22] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l712_c1_a305] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l732_c7_3340] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l737_c22_78c8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_1f53] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_return_output;

     -- t8_MUX[uxn_opcodes_h_l720_c7_fcb6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l720_c7_fcb6_cond <= VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_cond;
     t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue;
     t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output := t8_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l735_c21_763b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l735_c21_763b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l735_c31_858d_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l739_c7_1f53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l732_c7_3340] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l739_c7_1f53] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_1f53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l737_c3_b9c2 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l737_c22_78c8_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l735_c21_763b_return_output;
     VAR_printf_uxn_opcodes_h_l713_c3_0658_uxn_opcodes_h_l713_c3_0658_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l712_c1_a305_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_1f53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_1f53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_3340_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l739_c7_1f53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l739_c7_1f53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_3340_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_iffalse := VAR_t8_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue := VAR_result_u16_value_uxn_opcodes_h_l737_c3_b9c2;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l720_c7_fcb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l732_c7_3340] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l725_c7_ab22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l732_c7_3340] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l732_c7_3340] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_cond;
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output := result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l732_c7_3340] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_return_output;

     -- t8_MUX[uxn_opcodes_h_l717_c7_9190] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l717_c7_9190_cond <= VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_cond;
     t8_MUX_uxn_opcodes_h_l717_c7_9190_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_iftrue;
     t8_MUX_uxn_opcodes_h_l717_c7_9190_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_return_output := t8_MUX_uxn_opcodes_h_l717_c7_9190_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l732_c7_3340] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_return_output;

     -- printf_uxn_opcodes_h_l713_c3_0658[uxn_opcodes_h_l713_c3_0658] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l713_c3_0658_uxn_opcodes_h_l713_c3_0658_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l713_c3_0658_uxn_opcodes_h_l713_c3_0658_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l725_c7_ab22] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l732_c7_3340] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_cond;
     result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output := result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_3340_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_3340_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l732_c7_3340_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l732_c7_3340_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l732_c7_3340_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l717_c7_9190_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l725_c7_ab22] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond;
     result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output := result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l725_c7_ab22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;

     -- t8_MUX[uxn_opcodes_h_l712_c2_8b6a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l712_c2_8b6a_cond <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_cond;
     t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue;
     t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output := t8_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_ab22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_9190] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l725_c7_ab22] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l720_c7_fcb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l720_c7_fcb6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l725_c7_ab22] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l725_c7_ab22] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_cond;
     result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output := result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l725_c7_ab22_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l720_c7_fcb6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l712_c2_8b6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l720_c7_fcb6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output := result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l717_c7_9190] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l720_c7_fcb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l720_c7_fcb6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l720_c7_fcb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l717_c7_9190] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l720_c7_fcb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l717_c7_9190_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l717_c7_9190_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l720_c7_fcb6_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l717_c7_9190] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_9190] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l717_c7_9190] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l717_c7_9190] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_cond;
     result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output := result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_9190] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l717_c7_9190] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_cond;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output := result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l712_c2_8b6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l712_c2_8b6a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_9190_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_9190_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l717_c7_9190_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l717_c7_9190_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l717_c7_9190_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l712_c2_8b6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l712_c2_8b6a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output := result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l712_c2_8b6a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l712_c2_8b6a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output := result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l712_c2_8b6a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l712_c2_8b6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8_uxn_opcodes_h_l746_l708_DUPLICATE_c1fd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8_uxn_opcodes_h_l746_l708_DUPLICATE_c1fd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l712_c2_8b6a_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8_uxn_opcodes_h_l746_l708_DUPLICATE_c1fd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8_uxn_opcodes_h_l746_l708_DUPLICATE_c1fd_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
