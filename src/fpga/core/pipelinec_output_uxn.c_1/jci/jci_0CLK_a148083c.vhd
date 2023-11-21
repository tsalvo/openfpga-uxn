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
-- Submodules: 48
entity jci_0CLK_a148083c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_a148083c;
architecture arch of jci_0CLK_a148083c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l77_c6_803e]
signal BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c2_9b99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l77_c2_9b99]
signal result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c2_9b99]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l77_c2_9b99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c2_9b99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c2_9b99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l77_c2_9b99]
signal t8_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l77_c2_9b99]
signal tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l84_c11_49cd]
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l84_c7_807b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l84_c7_807b]
signal result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l84_c7_807b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l84_c7_807b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l84_c7_807b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l84_c7_807b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l84_c7_807b]
signal t8_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l84_c7_807b]
signal tmp16_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_3305]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_04ca]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l90_c7_04ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_04ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_04ca]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_04ca]
signal t8_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_04ca]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l93_c22_2659]
signal BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l95_c11_0fde]
signal BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l95_c7_bb76]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l95_c7_bb76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l95_c7_bb76]
signal result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l95_c7_bb76]
signal tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l97_c3_51d4]
signal CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c11_4663]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_8e21]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_8e21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l99_c7_8e21]
signal result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l99_c7_8e21]
signal tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l100_c3_4067]
signal BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l102_c22_000a]
signal BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l102_c32_6992]
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l102_c42_a760]
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l102_c42_87d7]
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l102_c22_b8dd]
signal MUX_uxn_opcodes_h_l102_c22_b8dd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l102_c22_b8dd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l102_c22_b8dd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l102_c22_b8dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l104_c11_102a]
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l104_c7_11ba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l104_c7_11ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e
BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_left,
BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_right,
BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99
result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_cond,
result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99
result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_return_output);

-- t8_MUX_uxn_opcodes_h_l77_c2_9b99
t8_MUX_uxn_opcodes_h_l77_c2_9b99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l77_c2_9b99_cond,
t8_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue,
t8_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse,
t8_MUX_uxn_opcodes_h_l77_c2_9b99_return_output);

-- tmp16_MUX_uxn_opcodes_h_l77_c2_9b99
tmp16_MUX_uxn_opcodes_h_l77_c2_9b99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_cond,
tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue,
tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse,
tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd
BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_left,
BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_right,
BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b
result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b
result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_cond,
result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b
result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_return_output);

-- t8_MUX_uxn_opcodes_h_l84_c7_807b
t8_MUX_uxn_opcodes_h_l84_c7_807b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l84_c7_807b_cond,
t8_MUX_uxn_opcodes_h_l84_c7_807b_iftrue,
t8_MUX_uxn_opcodes_h_l84_c7_807b_iffalse,
t8_MUX_uxn_opcodes_h_l84_c7_807b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l84_c7_807b
tmp16_MUX_uxn_opcodes_h_l84_c7_807b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l84_c7_807b_cond,
tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iftrue,
tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iffalse,
tmp16_MUX_uxn_opcodes_h_l84_c7_807b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305
BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca
result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca
result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_04ca
t8_MUX_uxn_opcodes_h_l90_c7_04ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_04ca_cond,
t8_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_04ca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_04ca
tmp16_MUX_uxn_opcodes_h_l90_c7_04ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659
BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_left,
BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_right,
BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde
BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_left,
BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_right,
BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76
result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76
result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76
result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_cond,
result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_return_output);

-- tmp16_MUX_uxn_opcodes_h_l95_c7_bb76
tmp16_MUX_uxn_opcodes_h_l95_c7_bb76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_cond,
tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue,
tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse,
tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_return_output);

-- CONST_SL_8_uxn_opcodes_h_l97_c3_51d4
CONST_SL_8_uxn_opcodes_h_l97_c3_51d4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_x,
CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663
BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21
result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_cond,
result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_return_output);

-- tmp16_MUX_uxn_opcodes_h_l99_c7_8e21
tmp16_MUX_uxn_opcodes_h_l99_c7_8e21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_cond,
tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue,
tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse,
tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l100_c3_4067
BIN_OP_OR_uxn_opcodes_h_l100_c3_4067 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_left,
BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_right,
BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a
BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_left,
BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_right,
BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992
BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_left,
BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_right,
BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760
BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_left,
BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_right,
BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7
BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_left,
BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_right,
BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_return_output);

-- MUX_uxn_opcodes_h_l102_c22_b8dd
MUX_uxn_opcodes_h_l102_c22_b8dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l102_c22_b8dd_cond,
MUX_uxn_opcodes_h_l102_c22_b8dd_iftrue,
MUX_uxn_opcodes_h_l102_c22_b8dd_iffalse,
MUX_uxn_opcodes_h_l102_c22_b8dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a
BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_left,
BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_right,
BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
 t8_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
 tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_return_output,
 t8_MUX_uxn_opcodes_h_l84_c7_807b_return_output,
 tmp16_MUX_uxn_opcodes_h_l84_c7_807b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_04ca_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_return_output,
 tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_return_output,
 CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_return_output,
 tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_return_output,
 BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_return_output,
 MUX_uxn_opcodes_h_l102_c22_b8dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_e804 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_0b42 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l85_c3_f0a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l84_c7_807b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l93_c3_f697 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l90_l77_DUPLICATE_2d9f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l99_l77_l95_DUPLICATE_699f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l95_l90_l84_l77_l104_DUPLICATE_ad7e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l77_l84_DUPLICATE_4bcd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l95_l90_l84_l104_DUPLICATE_c031_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l96_l100_DUPLICATE_dbe5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a_uxn_opcodes_h_l109_l72_DUPLICATE_d6a2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_e804 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_e804;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l85_c3_f0a1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l85_c3_f0a1;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_0b42 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_0b42;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_right := to_unsigned(3, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l95_l90_l84_l104_DUPLICATE_c031 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l95_l90_l84_l104_DUPLICATE_c031_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l95_l90_l84_l77_l104_DUPLICATE_ad7e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l95_l90_l84_l77_l104_DUPLICATE_ad7e_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l77_c6_803e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_left;
     BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output := BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l95_c11_0fde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_left;
     BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_return_output := BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l99_l77_l95_DUPLICATE_699f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l99_l77_l95_DUPLICATE_699f_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l102_c22_000a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_left;
     BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_return_output := BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l77_l84_DUPLICATE_4bcd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l77_l84_DUPLICATE_4bcd_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l96_l100_DUPLICATE_dbe5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l96_l100_DUPLICATE_dbe5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c11_4663] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l90_l77_DUPLICATE_2d9f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l90_l77_DUPLICATE_2d9f_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l84_c7_807b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l84_c7_807b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l104_c11_102a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_left;
     BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_return_output := BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_3305] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l93_c22_2659] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_left;
     BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_return_output := BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l102_c32_6992] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_left;
     BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_return_output := BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l84_c11_49cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l102_c22_000a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l104_c11_102a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c6_803e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l84_c11_49cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3305_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c11_0fde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_4663_return_output;
     VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c32_6992_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l93_c3_f697 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l93_c22_2659_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l96_l100_DUPLICATE_dbe5_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l96_l100_DUPLICATE_dbe5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l77_l84_DUPLICATE_4bcd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l77_l84_DUPLICATE_4bcd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l99_l77_l95_DUPLICATE_699f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l99_l77_l95_DUPLICATE_699f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l99_l77_l95_DUPLICATE_699f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l95_l90_l84_l104_DUPLICATE_c031_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l95_l90_l84_l104_DUPLICATE_c031_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l95_l90_l84_l104_DUPLICATE_c031_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l95_l90_l84_l104_DUPLICATE_c031_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l95_l90_l84_l104_DUPLICATE_c031_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l95_l90_l84_l77_l104_DUPLICATE_ad7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l95_l90_l84_l77_l104_DUPLICATE_ad7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l95_l90_l84_l77_l104_DUPLICATE_ad7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l95_l90_l84_l77_l104_DUPLICATE_ad7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l95_l90_l84_l77_l104_DUPLICATE_ad7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l90_l77_DUPLICATE_2d9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l90_l77_DUPLICATE_2d9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l84_c7_807b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue := VAR_result_u16_value_uxn_opcodes_h_l93_c3_f697;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l104_c7_11ba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l84_c7_807b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_04ca] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_04ca_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_return_output := t8_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l90_c7_04ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l84_c7_807b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l97_c3_51d4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_return_output := CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l100_c3_4067] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_left;
     BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_return_output := BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l104_c7_11ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_right := VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l100_c3_4067_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l97_c3_51d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l104_c7_11ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l104_c7_11ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l84_c7_807b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;
     -- t8_MUX[uxn_opcodes_h_l84_c7_807b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l84_c7_807b_cond <= VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_cond;
     t8_MUX_uxn_opcodes_h_l84_c7_807b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_iftrue;
     t8_MUX_uxn_opcodes_h_l84_c7_807b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_return_output := t8_MUX_uxn_opcodes_h_l84_c7_807b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_8e21] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_8e21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l84_c7_807b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l102_c42_a760] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_left;
     BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_return_output := BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c2_9b99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l99_c7_8e21] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_cond;
     tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue;
     tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_return_output := tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c2_9b99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_a760_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_8e21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_8e21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l84_c7_807b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse := VAR_t8_MUX_uxn_opcodes_h_l84_c7_807b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l99_c7_8e21_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l95_c7_bb76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c2_9b99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l95_c7_bb76] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_cond;
     tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue;
     tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_return_output := tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l102_c42_87d7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l95_c7_bb76] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_return_output;

     -- t8_MUX[uxn_opcodes_h_l77_c2_9b99] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l77_c2_9b99_cond <= VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_cond;
     t8_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue;
     t8_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_return_output := t8_MUX_uxn_opcodes_h_l77_c2_9b99_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c42_87d7_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l95_c7_bb76_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l95_c7_bb76_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l77_c2_9b99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l95_c7_bb76_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l90_c7_04ca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_04ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;

     -- MUX[uxn_opcodes_h_l102_c22_b8dd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l102_c22_b8dd_cond <= VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_cond;
     MUX_uxn_opcodes_h_l102_c22_b8dd_iftrue <= VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_iftrue;
     MUX_uxn_opcodes_h_l102_c22_b8dd_iffalse <= VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_return_output := MUX_uxn_opcodes_h_l102_c22_b8dd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_04ca] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue := VAR_MUX_uxn_opcodes_h_l102_c22_b8dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l84_c7_807b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l84_c7_807b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l84_c7_807b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_cond;
     tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_return_output := tmp16_MUX_uxn_opcodes_h_l84_c7_807b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l99_c7_8e21] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_cond;
     result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_return_output := result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l84_c7_807b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l84_c7_807b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l84_c7_807b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l99_c7_8e21_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l84_c7_807b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l77_c2_9b99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l95_c7_bb76] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_cond;
     result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_return_output := result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l77_c2_9b99] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_cond;
     tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue;
     tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_return_output := tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c2_9b99] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l95_c7_bb76_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l77_c2_9b99_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_04ca] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_04ca_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l84_c7_807b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_return_output := result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l84_c7_807b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l77_c2_9b99] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_cond;
     result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_return_output := result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a_uxn_opcodes_h_l109_l72_DUPLICATE_d6a2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a_uxn_opcodes_h_l109_l72_DUPLICATE_d6a2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c2_9b99_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c2_9b99_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a_uxn_opcodes_h_l109_l72_DUPLICATE_d6a2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dd4a_uxn_opcodes_h_l109_l72_DUPLICATE_d6a2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
