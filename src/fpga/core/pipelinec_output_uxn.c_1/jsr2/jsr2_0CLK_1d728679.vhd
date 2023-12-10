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
-- Submodules: 62
entity jsr2_0CLK_1d728679 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_1d728679;
architecture arch of jsr2_0CLK_1d728679 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l763_c6_506c]
signal BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l763_c2_96f9]
signal t16_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l763_c2_96f9]
signal result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l763_c2_96f9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l763_c2_96f9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l763_c2_96f9]
signal result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l763_c2_96f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l763_c2_96f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l763_c2_96f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l763_c2_96f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l770_c11_37ca]
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l770_c7_7ec9]
signal t16_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l770_c7_7ec9]
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l770_c7_7ec9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l770_c7_7ec9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l770_c7_7ec9]
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l770_c7_7ec9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l770_c7_7ec9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l770_c7_7ec9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l770_c7_7ec9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l773_c11_e2a7]
signal BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l773_c7_f034]
signal t16_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l773_c7_f034]
signal result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c7_f034]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c7_f034]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l773_c7_f034]
signal result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l773_c7_f034]
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l773_c7_f034]
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c7_f034]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c7_f034]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l775_c3_be2e]
signal CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l777_c30_91de]
signal sp_relative_shift_uxn_opcodes_h_l777_c30_91de_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l777_c30_91de_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l777_c30_91de_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l777_c30_91de_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l779_c11_0cb0]
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l779_c7_5db0]
signal t16_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l779_c7_5db0]
signal result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l779_c7_5db0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l779_c7_5db0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l779_c7_5db0]
signal result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l779_c7_5db0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l779_c7_5db0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l779_c7_5db0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l779_c7_5db0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l780_c3_6bae]
signal BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l787_c11_7652]
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l787_c7_2a88]
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l787_c7_2a88]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l787_c7_2a88]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l787_c7_2a88]
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l787_c7_2a88]
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l787_c7_2a88]
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l787_c7_2a88]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l787_c7_2a88]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l790_c31_4297]
signal CONST_SR_8_uxn_opcodes_h_l790_c31_4297_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l790_c31_4297_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_41a2]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_d22b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_d22b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_d22b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_d22b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a30a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c
BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_left,
BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_right,
BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output);

-- t16_MUX_uxn_opcodes_h_l763_c2_96f9
t16_MUX_uxn_opcodes_h_l763_c2_96f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l763_c2_96f9_cond,
t16_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue,
t16_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse,
t16_MUX_uxn_opcodes_h_l763_c2_96f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9
result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9
result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9
result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond,
result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9
result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9
result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca
BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_left,
BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_right,
BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output);

-- t16_MUX_uxn_opcodes_h_l770_c7_7ec9
t16_MUX_uxn_opcodes_h_l770_c7_7ec9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l770_c7_7ec9_cond,
t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue,
t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse,
t16_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9
result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9
result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7
BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_left,
BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_right,
BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output);

-- t16_MUX_uxn_opcodes_h_l773_c7_f034
t16_MUX_uxn_opcodes_h_l773_c7_f034 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l773_c7_f034_cond,
t16_MUX_uxn_opcodes_h_l773_c7_f034_iftrue,
t16_MUX_uxn_opcodes_h_l773_c7_f034_iffalse,
t16_MUX_uxn_opcodes_h_l773_c7_f034_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034
result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_cond,
result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034
result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_cond,
result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034
result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034
result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_return_output);

-- CONST_SL_8_uxn_opcodes_h_l775_c3_be2e
CONST_SL_8_uxn_opcodes_h_l775_c3_be2e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_x,
CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l777_c30_91de
sp_relative_shift_uxn_opcodes_h_l777_c30_91de : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l777_c30_91de_ins,
sp_relative_shift_uxn_opcodes_h_l777_c30_91de_x,
sp_relative_shift_uxn_opcodes_h_l777_c30_91de_y,
sp_relative_shift_uxn_opcodes_h_l777_c30_91de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0
BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_left,
BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_right,
BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output);

-- t16_MUX_uxn_opcodes_h_l779_c7_5db0
t16_MUX_uxn_opcodes_h_l779_c7_5db0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l779_c7_5db0_cond,
t16_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue,
t16_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse,
t16_MUX_uxn_opcodes_h_l779_c7_5db0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0
result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond,
result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0
result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond,
result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae
BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_left,
BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_right,
BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652
BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_left,
BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_right,
BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88
result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88
result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_return_output);

-- CONST_SR_8_uxn_opcodes_h_l790_c31_4297
CONST_SR_8_uxn_opcodes_h_l790_c31_4297 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l790_c31_4297_x,
CONST_SR_8_uxn_opcodes_h_l790_c31_4297_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2
BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output,
 t16_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output,
 t16_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output,
 t16_MUX_uxn_opcodes_h_l773_c7_f034_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_return_output,
 CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_return_output,
 sp_relative_shift_uxn_opcodes_h_l777_c30_91de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output,
 t16_MUX_uxn_opcodes_h_l779_c7_5db0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_return_output,
 CONST_SR_8_uxn_opcodes_h_l790_c31_4297_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l767_c3_3bd9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l771_c3_adea : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l782_c3_3cf1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_eacc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l785_c21_8c2c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l788_c3_a908 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_9610 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_4297_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_4297_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l790_c21_a3d8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l770_l787_l773_l763_DUPLICATE_c0b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_722c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l763_l794_l779_l773_DUPLICATE_0ec7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l763_l787_l779_l773_DUPLICATE_4d3f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_8045_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l787_l763_DUPLICATE_7643_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l794_l787_l779_l773_DUPLICATE_5e60_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l774_l780_DUPLICATE_278f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l787_l773_DUPLICATE_c50b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a30a_uxn_opcodes_h_l801_l759_DUPLICATE_326d_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_9610 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l789_c3_9610;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l767_c3_3bd9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l767_c3_3bd9;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l788_c3_a908 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l788_c3_a908;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_eacc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_eacc;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l782_c3_3cf1 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l782_c3_3cf1;
     VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l771_c3_adea := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l771_c3_adea;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_4297_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l763_c6_506c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_left;
     BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output := BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l763_l787_l779_l773_DUPLICATE_4d3f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l763_l787_l779_l773_DUPLICATE_4d3f_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l773_c11_e2a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l790_c31_4297] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l790_c31_4297_x <= VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_4297_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_4297_return_output := CONST_SR_8_uxn_opcodes_h_l790_c31_4297_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_41a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l770_c11_37ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_722c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_722c_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l777_c30_91de] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l777_c30_91de_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_ins;
     sp_relative_shift_uxn_opcodes_h_l777_c30_91de_x <= VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_x;
     sp_relative_shift_uxn_opcodes_h_l777_c30_91de_y <= VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_return_output := sp_relative_shift_uxn_opcodes_h_l777_c30_91de_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_8045 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_8045_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l785_c21_8c2c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l785_c21_8c2c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l787_c11_7652] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_left;
     BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output := BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l763_l794_l779_l773_DUPLICATE_0ec7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l763_l794_l779_l773_DUPLICATE_0ec7_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l794_l787_l779_l773_DUPLICATE_5e60 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l794_l787_l779_l773_DUPLICATE_5e60_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l774_l780_DUPLICATE_278f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l774_l780_DUPLICATE_278f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l787_l763_DUPLICATE_7643 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l787_l763_DUPLICATE_7643_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l787_l773_DUPLICATE_c50b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l787_l773_DUPLICATE_c50b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l779_c11_0cb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l770_l787_l773_l763_DUPLICATE_c0b4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l770_l787_l773_l763_DUPLICATE_c0b4_return_output := result.u8_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l763_c6_506c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_37ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c11_e2a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l779_c11_0cb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_7652_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_41a2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l774_l780_DUPLICATE_278f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l774_l780_DUPLICATE_278f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l785_c21_8c2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l787_l763_DUPLICATE_7643_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l787_l763_DUPLICATE_7643_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l770_l787_l763_DUPLICATE_7643_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l763_l787_l779_l773_DUPLICATE_4d3f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l763_l787_l779_l773_DUPLICATE_4d3f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l763_l787_l779_l773_DUPLICATE_4d3f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l763_l787_l779_l773_DUPLICATE_4d3f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l770_l763_l787_l779_l773_DUPLICATE_4d3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l794_l787_l779_l773_DUPLICATE_5e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l794_l787_l779_l773_DUPLICATE_5e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l794_l787_l779_l773_DUPLICATE_5e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l794_l787_l779_l773_DUPLICATE_5e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l770_l794_l787_l779_l773_DUPLICATE_5e60_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l763_l794_l779_l773_DUPLICATE_0ec7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l763_l794_l779_l773_DUPLICATE_0ec7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l763_l794_l779_l773_DUPLICATE_0ec7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l763_l794_l779_l773_DUPLICATE_0ec7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l770_l763_l794_l779_l773_DUPLICATE_0ec7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_722c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_722c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_722c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_722c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_722c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_8045_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_8045_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_8045_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_8045_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l770_l763_l794_l787_l773_DUPLICATE_8045_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l787_l773_DUPLICATE_c50b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l787_l773_DUPLICATE_c50b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l770_l787_l773_l763_DUPLICATE_c0b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l770_l787_l773_l763_DUPLICATE_c0b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l770_l787_l773_l763_DUPLICATE_c0b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l770_l787_l773_l763_DUPLICATE_c0b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l777_c30_91de_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l787_c7_2a88] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_d22b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_d22b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l790_c21_a3d8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l790_c21_a3d8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l790_c31_4297_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l787_c7_2a88] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l780_c3_6bae] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_left;
     BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_return_output := BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_d22b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l775_c3_be2e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_return_output := CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l787_c7_2a88] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond;
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output := result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_d22b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l780_c3_6bae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l790_c21_a3d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l775_c3_be2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_d22b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_d22b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_d22b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_d22b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l787_c7_2a88] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l779_c7_5db0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output := result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;

     -- t16_MUX[uxn_opcodes_h_l779_c7_5db0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l779_c7_5db0_cond <= VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_cond;
     t16_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue;
     t16_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_return_output := t16_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l787_c7_2a88] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l779_c7_5db0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l787_c7_2a88] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l779_c7_5db0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l787_c7_2a88] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_cond;
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output := result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l787_c7_2a88] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_2a88_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_iffalse := VAR_t16_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l779_c7_5db0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l773_c7_f034] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_cond;
     result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output := result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c7_f034] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_return_output;

     -- t16_MUX[uxn_opcodes_h_l773_c7_f034] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l773_c7_f034_cond <= VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_cond;
     t16_MUX_uxn_opcodes_h_l773_c7_f034_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_iftrue;
     t16_MUX_uxn_opcodes_h_l773_c7_f034_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_return_output := t16_MUX_uxn_opcodes_h_l773_c7_f034_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c7_f034] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l779_c7_5db0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l779_c7_5db0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l779_c7_5db0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l779_c7_5db0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output := result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c7_f034_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c7_f034_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l779_c7_5db0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l773_c7_f034_return_output;
     -- t16_MUX[uxn_opcodes_h_l770_c7_7ec9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l770_c7_7ec9_cond <= VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_cond;
     t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue;
     t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output := t16_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l770_c7_7ec9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output := result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l773_c7_f034] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l770_c7_7ec9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l773_c7_f034] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_cond;
     result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output := result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c7_f034] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l770_c7_7ec9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c7_f034] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l773_c7_f034] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c7_f034_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c7_f034_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c7_f034_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c7_f034_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c7_f034_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l763_c2_96f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l770_c7_7ec9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l763_c2_96f9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output := result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output;

     -- t16_MUX[uxn_opcodes_h_l763_c2_96f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l763_c2_96f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_cond;
     t16_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue;
     t16_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_return_output := t16_MUX_uxn_opcodes_h_l763_c2_96f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l763_c2_96f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l770_c7_7ec9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l770_c7_7ec9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output := result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l770_c7_7ec9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l770_c7_7ec9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_7ec9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l763_c2_96f9_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l763_c2_96f9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l763_c2_96f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l763_c2_96f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l763_c2_96f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l763_c2_96f9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a30a_uxn_opcodes_h_l801_l759_DUPLICATE_326d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a30a_uxn_opcodes_h_l801_l759_DUPLICATE_326d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a30a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l763_c2_96f9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l763_c2_96f9_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a30a_uxn_opcodes_h_l801_l759_DUPLICATE_326d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a30a_uxn_opcodes_h_l801_l759_DUPLICATE_326d_return_output;
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
