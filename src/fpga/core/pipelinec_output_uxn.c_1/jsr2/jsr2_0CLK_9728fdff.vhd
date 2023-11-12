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
-- Submodules: 78
entity jsr2_0CLK_9728fdff is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_9728fdff;
architecture arch of jsr2_0CLK_9728fdff is
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
-- BIN_OP_EQ[uxn_opcodes_h_l753_c6_b152]
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l753_c1_a465]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l753_c2_8697]
signal t16_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l753_c2_8697]
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c2_8697]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c2_8697]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l753_c2_8697]
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l753_c2_8697]
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l753_c2_8697]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l753_c2_8697]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l753_c2_8697]
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c2_8697]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l754_c3_c2e1[uxn_opcodes_h_l754_c3_c2e1]
signal printf_uxn_opcodes_h_l754_c3_c2e1_uxn_opcodes_h_l754_c3_c2e1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l758_c11_adef]
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l758_c7_5494]
signal t16_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l758_c7_5494]
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l758_c7_5494]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_5494]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l758_c7_5494]
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l758_c7_5494]
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l758_c7_5494]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_5494]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_5494]
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l758_c7_5494]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l761_c11_5882]
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l761_c7_ba6a]
signal t16_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l761_c7_ba6a]
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l761_c7_ba6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l761_c7_ba6a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l761_c7_ba6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l761_c7_ba6a]
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l761_c7_ba6a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l761_c7_ba6a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l761_c7_ba6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l761_c7_ba6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l763_c3_081f]
signal CONST_SL_8_uxn_opcodes_h_l763_c3_081f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l763_c3_081f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l765_c11_7236]
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l765_c7_0223]
signal t16_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l765_c7_0223]
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l765_c7_0223]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l765_c7_0223]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l765_c7_0223]
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l765_c7_0223]
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l765_c7_0223]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l765_c7_0223]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l765_c7_0223]
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l765_c7_0223]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l766_c3_0e37]
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l768_c30_2a73]
signal sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l770_c11_1d80]
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l770_c7_037f]
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l770_c7_037f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l770_c7_037f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l770_c7_037f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l770_c7_037f]
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l770_c7_037f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l770_c7_037f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l770_c7_037f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l770_c7_037f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l777_c11_e5b5]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l777_c7_2d10]
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_2d10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_2d10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_2d10]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l777_c7_2d10]
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_2d10]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_2d10]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_2d10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l780_c31_715d]
signal CONST_SR_8_uxn_opcodes_h_l780_c31_715d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l780_c31_715d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l784_c11_c9f4]
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_011d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_011d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_011d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_011d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152
BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_left,
BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_right,
BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_return_output);

-- t16_MUX_uxn_opcodes_h_l753_c2_8697
t16_MUX_uxn_opcodes_h_l753_c2_8697 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l753_c2_8697_cond,
t16_MUX_uxn_opcodes_h_l753_c2_8697_iftrue,
t16_MUX_uxn_opcodes_h_l753_c2_8697_iffalse,
t16_MUX_uxn_opcodes_h_l753_c2_8697_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697
result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_cond,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697
result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_cond,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output);

-- printf_uxn_opcodes_h_l754_c3_c2e1_uxn_opcodes_h_l754_c3_c2e1
printf_uxn_opcodes_h_l754_c3_c2e1_uxn_opcodes_h_l754_c3_c2e1 : entity work.printf_uxn_opcodes_h_l754_c3_c2e1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l754_c3_c2e1_uxn_opcodes_h_l754_c3_c2e1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef
BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_left,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_right,
BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output);

-- t16_MUX_uxn_opcodes_h_l758_c7_5494
t16_MUX_uxn_opcodes_h_l758_c7_5494 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l758_c7_5494_cond,
t16_MUX_uxn_opcodes_h_l758_c7_5494_iftrue,
t16_MUX_uxn_opcodes_h_l758_c7_5494_iffalse,
t16_MUX_uxn_opcodes_h_l758_c7_5494_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494
result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_cond,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494
result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_cond,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882
BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_left,
BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_right,
BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output);

-- t16_MUX_uxn_opcodes_h_l761_c7_ba6a
t16_MUX_uxn_opcodes_h_l761_c7_ba6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l761_c7_ba6a_cond,
t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue,
t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse,
t16_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a
result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a
result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l763_c3_081f
CONST_SL_8_uxn_opcodes_h_l763_c3_081f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l763_c3_081f_x,
CONST_SL_8_uxn_opcodes_h_l763_c3_081f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236
BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_left,
BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_right,
BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output);

-- t16_MUX_uxn_opcodes_h_l765_c7_0223
t16_MUX_uxn_opcodes_h_l765_c7_0223 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l765_c7_0223_cond,
t16_MUX_uxn_opcodes_h_l765_c7_0223_iftrue,
t16_MUX_uxn_opcodes_h_l765_c7_0223_iffalse,
t16_MUX_uxn_opcodes_h_l765_c7_0223_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223
result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_cond,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223
result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_cond,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37
BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_left,
BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_right,
BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_return_output);

-- sp_relative_shift_uxn_opcodes_h_l768_c30_2a73
sp_relative_shift_uxn_opcodes_h_l768_c30_2a73 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_ins,
sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_x,
sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_y,
sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80
BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_left,
BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_right,
BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f
result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_cond,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f
result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_cond,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5
BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10
result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10
result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_return_output);

-- CONST_SR_8_uxn_opcodes_h_l780_c31_715d
CONST_SR_8_uxn_opcodes_h_l780_c31_715d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l780_c31_715d_x,
CONST_SR_8_uxn_opcodes_h_l780_c31_715d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4
BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_left,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_right,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_return_output,
 t16_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output,
 t16_MUX_uxn_opcodes_h_l758_c7_5494_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output,
 t16_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output,
 CONST_SL_8_uxn_opcodes_h_l763_c3_081f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output,
 t16_MUX_uxn_opcodes_h_l765_c7_0223_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output,
 BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_return_output,
 sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_return_output,
 CONST_SR_8_uxn_opcodes_h_l780_c31_715d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_28db : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l754_c3_c2e1_uxn_opcodes_h_l754_c3_c2e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_b1b4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_081f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_081f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_640e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_34ce : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_2312_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_e883 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_715d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_715d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_7940_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_8547_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_4050_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_ef58_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_fe5b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_c08a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_46f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_e2ec_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_72b9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l766_l762_DUPLICATE_9349_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_fea0_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8_uxn_opcodes_h_l791_l749_DUPLICATE_0e5a_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_b1b4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l759_c3_b1b4;
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_28db := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l755_c3_28db;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_e883 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_e883;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_34ce := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l772_c3_34ce;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_640e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l774_c3_640e;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_715d_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_iffalse := t16;
     -- CONST_SR_8[uxn_opcodes_h_l780_c31_715d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l780_c31_715d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_715d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_715d_return_output := CONST_SR_8_uxn_opcodes_h_l780_c31_715d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l775_c21_2312] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_2312_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c11_e5b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l753_c6_b152] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_left;
     BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output := BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_8547 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_8547_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_c08a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_c08a_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l765_c11_7236] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_left;
     BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output := BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_fea0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_fea0_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l766_l762_DUPLICATE_9349 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l766_l762_DUPLICATE_9349_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l768_c30_2a73] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_ins;
     sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_x <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_x;
     sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_y <= VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_return_output := sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_ef58 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_ef58_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_4050 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_4050_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_e2ec LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_e2ec_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l761_c11_5882] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_left;
     BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output := BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l758_c11_adef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_left;
     BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output := BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l770_c11_1d80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_left;
     BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output := BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_46f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_46f8_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_72b9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_72b9_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_fe5b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_fe5b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l784_c11_c9f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c6_b152_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l758_c11_adef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l761_c11_5882_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_7236_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l770_c11_1d80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e5b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_c9f4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l766_l762_DUPLICATE_9349_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_081f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l766_l762_DUPLICATE_9349_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l775_c21_2312_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_e2ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_e2ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_e2ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l753_l758_l770_l761_DUPLICATE_e2ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_8547_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_8547_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_8547_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_8547_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_8547_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_l770_DUPLICATE_8547_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_72b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_72b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_72b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_72b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_72b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l765_l761_l758_l784_l777_l770_DUPLICATE_72b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_46f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_46f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_46f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_46f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_46f8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l770_DUPLICATE_46f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_4050_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_4050_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_4050_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_4050_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l761_l758_l753_l777_l770_DUPLICATE_4050_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_c08a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_c08a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_c08a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_c08a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_c08a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_c08a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_ef58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_ef58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_ef58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_ef58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_ef58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l765_l761_l758_l753_l784_l777_DUPLICATE_ef58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_fea0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_fea0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l777_l765_l761_DUPLICATE_fea0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_fe5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_fe5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_fe5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_fe5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l765_l761_l758_l753_l777_DUPLICATE_fe5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l768_c30_2a73_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l780_c21_7940] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_7940_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l780_c31_715d_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_011d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l770_c7_037f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l777_c7_2d10] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output := result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_2d10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l753_c1_a465] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_011d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l766_c3_0e37] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_left;
     BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_return_output := BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_011d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_011d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_2d10] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l763_c3_081f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l763_c3_081f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_081f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_081f_return_output := CONST_SL_8_uxn_opcodes_h_l763_c3_081f_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l766_c3_0e37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l780_c21_7940_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l763_c3_081f_return_output;
     VAR_printf_uxn_opcodes_h_l754_c3_c2e1_uxn_opcodes_h_l754_c3_c2e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l753_c1_a465_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_011d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_011d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_011d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_011d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l777_c7_2d10] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_cond;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output := result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;

     -- t16_MUX[uxn_opcodes_h_l765_c7_0223] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l765_c7_0223_cond <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_cond;
     t16_MUX_uxn_opcodes_h_l765_c7_0223_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_iftrue;
     t16_MUX_uxn_opcodes_h_l765_c7_0223_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_return_output := t16_MUX_uxn_opcodes_h_l765_c7_0223_return_output;

     -- printf_uxn_opcodes_h_l754_c3_c2e1[uxn_opcodes_h_l754_c3_c2e1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l754_c3_c2e1_uxn_opcodes_h_l754_c3_c2e1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l754_c3_c2e1_uxn_opcodes_h_l754_c3_c2e1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l770_c7_037f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_2d10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l770_c7_037f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output := result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l765_c7_0223] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_2d10] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l770_c7_037f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_2d10] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_2d10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l770_c7_037f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l770_c7_037f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_2d10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l765_c7_0223_return_output;
     -- t16_MUX[uxn_opcodes_h_l761_c7_ba6a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l761_c7_ba6a_cond <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_cond;
     t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue;
     t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output := t16_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l770_c7_037f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l770_c7_037f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l761_c7_ba6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l765_c7_0223] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_cond;
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output := result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l770_c7_037f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l765_c7_0223] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l770_c7_037f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output := result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l765_c7_0223] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l770_c7_037f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l770_c7_037f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l770_c7_037f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l765_c7_0223_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l770_c7_037f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l770_c7_037f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l765_c7_0223_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l770_c7_037f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_iffalse := VAR_t16_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l765_c7_0223] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l765_c7_0223] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l765_c7_0223] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l761_c7_ba6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l765_c7_0223] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l765_c7_0223] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_cond;
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output := result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l761_c7_ba6a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l758_c7_5494] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l761_c7_ba6a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output := result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;

     -- t16_MUX[uxn_opcodes_h_l758_c7_5494] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l758_c7_5494_cond <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_cond;
     t16_MUX_uxn_opcodes_h_l758_c7_5494_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_iftrue;
     t16_MUX_uxn_opcodes_h_l758_c7_5494_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_return_output := t16_MUX_uxn_opcodes_h_l758_c7_5494_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_0223_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l765_c7_0223_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l765_c7_0223_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_0223_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l765_c7_0223_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_iffalse := VAR_t16_MUX_uxn_opcodes_h_l758_c7_5494_return_output;
     -- t16_MUX[uxn_opcodes_h_l753_c2_8697] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l753_c2_8697_cond <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_cond;
     t16_MUX_uxn_opcodes_h_l753_c2_8697_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_iftrue;
     t16_MUX_uxn_opcodes_h_l753_c2_8697_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_return_output := t16_MUX_uxn_opcodes_h_l753_c2_8697_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l761_c7_ba6a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c2_8697] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l758_c7_5494] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_cond;
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output := result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l761_c7_ba6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l761_c7_ba6a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l761_c7_ba6a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output := result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l758_c7_5494] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l758_c7_5494] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l761_c7_ba6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l758_c7_5494_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l758_c7_5494_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l761_c7_ba6a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l753_c2_8697_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l758_c7_5494] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c2_8697] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l753_c2_8697] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_cond;
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output := result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l758_c7_5494] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l758_c7_5494] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c2_8697] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l758_c7_5494] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l758_c7_5494] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_cond;
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output := result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l758_c7_5494_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l758_c7_5494_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l758_c7_5494_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l758_c7_5494_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l758_c7_5494_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l753_c2_8697] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l753_c2_8697] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l753_c2_8697] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_cond;
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output := result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l753_c2_8697] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l753_c2_8697] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8_uxn_opcodes_h_l791_l749_DUPLICATE_0e5a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8_uxn_opcodes_h_l791_l749_DUPLICATE_0e5a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c2_8697_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c2_8697_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8_uxn_opcodes_h_l791_l749_DUPLICATE_0e5a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ff8_uxn_opcodes_h_l791_l749_DUPLICATE_0e5a_return_output;
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
