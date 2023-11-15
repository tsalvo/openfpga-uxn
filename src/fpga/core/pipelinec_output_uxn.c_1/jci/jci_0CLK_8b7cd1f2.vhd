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
-- Submodules: 50
entity jci_0CLK_8b7cd1f2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_8b7cd1f2;
architecture arch of jci_0CLK_8b7cd1f2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l72_c6_0a5e]
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l72_c1_3c39]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l72_c2_7802]
signal t8_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l72_c2_7802]
signal tmp16_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l72_c2_7802]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l72_c2_7802]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l72_c2_7802]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l72_c2_7802]
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l72_c2_7802]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l72_c2_7802]
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l73_c3_24d5[uxn_opcodes_h_l73_c3_24d5]
signal printf_uxn_opcodes_h_l73_c3_24d5_uxn_opcodes_h_l73_c3_24d5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l77_c11_e83c]
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l77_c7_8a7d]
signal t8_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l77_c7_8a7d]
signal tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c7_8a7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_8a7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_8a7d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_8a7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_8a7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l77_c7_8a7d]
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l83_c11_79cf]
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l83_c7_2692]
signal t8_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l83_c7_2692]
signal tmp16_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l83_c7_2692]
signal result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l83_c7_2692]
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l83_c7_2692]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l83_c7_2692]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l86_c22_5662]
signal BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l88_c11_297c]
signal BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l88_c7_6fee]
signal tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l88_c7_6fee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l88_c7_6fee]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l88_c7_6fee]
signal result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l90_c3_5f0b]
signal CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l92_c11_a7a0]
signal BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l92_c7_06ea]
signal tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l92_c7_06ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l92_c7_06ea]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l92_c7_06ea]
signal result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l93_c3_9ac2]
signal BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l95_c22_34a6]
signal BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l95_c32_9b2c]
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l95_c42_d877]
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l95_c42_520f]
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l95_c22_01df]
signal MUX_uxn_opcodes_h_l95_c22_01df_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l95_c22_01df_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l95_c22_01df_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l95_c22_01df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c11_51a0]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l97_c7_8e61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l97_c7_8e61]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4c49( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.u16_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e
BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_left,
BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_right,
BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_return_output);

-- t8_MUX_uxn_opcodes_h_l72_c2_7802
t8_MUX_uxn_opcodes_h_l72_c2_7802 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l72_c2_7802_cond,
t8_MUX_uxn_opcodes_h_l72_c2_7802_iftrue,
t8_MUX_uxn_opcodes_h_l72_c2_7802_iffalse,
t8_MUX_uxn_opcodes_h_l72_c2_7802_return_output);

-- tmp16_MUX_uxn_opcodes_h_l72_c2_7802
tmp16_MUX_uxn_opcodes_h_l72_c2_7802 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l72_c2_7802_cond,
tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iftrue,
tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iffalse,
tmp16_MUX_uxn_opcodes_h_l72_c2_7802_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802
result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_cond,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_return_output);

-- printf_uxn_opcodes_h_l73_c3_24d5_uxn_opcodes_h_l73_c3_24d5
printf_uxn_opcodes_h_l73_c3_24d5_uxn_opcodes_h_l73_c3_24d5 : entity work.printf_uxn_opcodes_h_l73_c3_24d5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l73_c3_24d5_uxn_opcodes_h_l73_c3_24d5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c
BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_left,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_right,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output);

-- t8_MUX_uxn_opcodes_h_l77_c7_8a7d
t8_MUX_uxn_opcodes_h_l77_c7_8a7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l77_c7_8a7d_cond,
t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue,
t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse,
t8_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d
tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_cond,
tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue,
tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse,
tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d
result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_cond,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf
BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_left,
BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_right,
BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output);

-- t8_MUX_uxn_opcodes_h_l83_c7_2692
t8_MUX_uxn_opcodes_h_l83_c7_2692 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l83_c7_2692_cond,
t8_MUX_uxn_opcodes_h_l83_c7_2692_iftrue,
t8_MUX_uxn_opcodes_h_l83_c7_2692_iffalse,
t8_MUX_uxn_opcodes_h_l83_c7_2692_return_output);

-- tmp16_MUX_uxn_opcodes_h_l83_c7_2692
tmp16_MUX_uxn_opcodes_h_l83_c7_2692 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l83_c7_2692_cond,
tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iftrue,
tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iffalse,
tmp16_MUX_uxn_opcodes_h_l83_c7_2692_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692
result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_cond,
result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662
BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_left,
BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_right,
BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c
BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_left,
BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_right,
BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l88_c7_6fee
tmp16_MUX_uxn_opcodes_h_l88_c7_6fee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_cond,
tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue,
tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse,
tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee
result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_cond,
result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_return_output);

-- CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b
CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_x,
CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0
BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_left,
BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_right,
BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l92_c7_06ea
tmp16_MUX_uxn_opcodes_h_l92_c7_06ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_cond,
tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue,
tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse,
tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea
result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea
result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea
result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_cond,
result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2
BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_left,
BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_right,
BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6
BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_left,
BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_right,
BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c
BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_left,
BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_right,
BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877
BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_left,
BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_right,
BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f
BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_left,
BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_right,
BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_return_output);

-- MUX_uxn_opcodes_h_l95_c22_01df
MUX_uxn_opcodes_h_l95_c22_01df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l95_c22_01df_cond,
MUX_uxn_opcodes_h_l95_c22_01df_iftrue,
MUX_uxn_opcodes_h_l95_c22_01df_iffalse,
MUX_uxn_opcodes_h_l95_c22_01df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0
BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_return_output,
 t8_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
 tmp16_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output,
 t8_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output,
 tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output,
 t8_MUX_uxn_opcodes_h_l83_c7_2692_return_output,
 tmp16_MUX_uxn_opcodes_h_l83_c7_2692_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_return_output,
 tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_return_output,
 CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_return_output,
 tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_return_output,
 BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_return_output,
 MUX_uxn_opcodes_h_l95_c22_01df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_a320 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l73_c3_24d5_uxn_opcodes_h_l73_c3_24d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_ab7d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_8a7d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l80_c3_5811 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l86_c3_5953 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l95_c22_01df_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l95_c22_01df_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l95_c22_01df_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l95_c22_01df_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_DUPLICATE_80d0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l83_l77_l72_l97_l88_DUPLICATE_bf55_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l83_l72_DUPLICATE_de0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l88_l92_DUPLICATE_6012_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l83_l77_l97_l92_l88_DUPLICATE_11b0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l89_l93_DUPLICATE_c360_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l102_l67_DUPLICATE_9728_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l80_c3_5811 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l80_c3_5811;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_a320 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_a320;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_ab7d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_ab7d;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l95_c32_9b2c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l97_c11_51a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l77_c11_e83c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_left;
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output := BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l83_l72_DUPLICATE_de0c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l83_l72_DUPLICATE_de0c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l88_l92_DUPLICATE_6012 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l88_l92_DUPLICATE_6012_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l95_c22_34a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l83_c11_79cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l83_l77_l97_l92_l88_DUPLICATE_11b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l83_l77_l97_l92_l88_DUPLICATE_11b0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l72_c6_0a5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l77_c7_8a7d] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_8a7d_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l89_l93_DUPLICATE_c360 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l89_l93_DUPLICATE_c360_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_DUPLICATE_80d0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_DUPLICATE_80d0_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l83_l77_l72_l97_l88_DUPLICATE_bf55 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l83_l77_l72_l97_l88_DUPLICATE_bf55_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l88_c11_297c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_left;
     BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_return_output := BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l92_c11_a7a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l86_c22_5662] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_left;
     BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_return_output := BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_0a5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_e83c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l83_c11_79cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l88_c11_297c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l92_c11_a7a0_return_output;
     VAR_MUX_uxn_opcodes_h_l95_c22_01df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l95_c22_34a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c11_51a0_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l86_c3_5953 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l86_c22_5662_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l95_c22_01df_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c32_9b2c_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l89_l93_DUPLICATE_c360_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l89_l93_DUPLICATE_c360_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_DUPLICATE_80d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_DUPLICATE_80d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l88_l92_DUPLICATE_6012_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l88_l92_DUPLICATE_6012_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l88_l92_DUPLICATE_6012_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l83_l77_l97_l92_l88_DUPLICATE_11b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l83_l77_l97_l92_l88_DUPLICATE_11b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l83_l77_l97_l92_l88_DUPLICATE_11b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l83_l77_l97_l92_l88_DUPLICATE_11b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l83_l77_l97_l92_l88_DUPLICATE_11b0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l83_l77_l72_l97_l88_DUPLICATE_bf55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l83_l77_l72_l97_l88_DUPLICATE_bf55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l83_l77_l72_l97_l88_DUPLICATE_bf55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l83_l77_l72_l97_l88_DUPLICATE_bf55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l83_l77_l72_l97_l88_DUPLICATE_bf55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l83_l72_DUPLICATE_de0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l83_l72_DUPLICATE_de0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_8a7d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iftrue := VAR_result_u16_value_uxn_opcodes_h_l86_c3_5953;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l72_c1_3c39] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_8a7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c7_8a7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l90_c3_5f0b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_return_output := CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l93_c3_9ac2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_left;
     BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_return_output := BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_return_output;

     -- t8_MUX[uxn_opcodes_h_l83_c7_2692] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l83_c7_2692_cond <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_cond;
     t8_MUX_uxn_opcodes_h_l83_c7_2692_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_iftrue;
     t8_MUX_uxn_opcodes_h_l83_c7_2692_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_return_output := t8_MUX_uxn_opcodes_h_l83_c7_2692_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l83_c7_2692] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l97_c7_8e61] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l97_c7_8e61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_right := VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l93_c3_9ac2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l90_c3_5f0b_return_output;
     VAR_printf_uxn_opcodes_h_l73_c3_24d5_uxn_opcodes_h_l73_c3_24d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_3c39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l97_c7_8e61_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l97_c7_8e61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l83_c7_2692_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l83_c7_2692_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l72_c2_7802] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l72_c2_7802] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_return_output;

     -- t8_MUX[uxn_opcodes_h_l77_c7_8a7d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l77_c7_8a7d_cond <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_cond;
     t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue;
     t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output := t8_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l92_c7_06ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_8a7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l92_c7_06ea] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l95_c42_d877] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_left;
     BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_return_output := BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l92_c7_06ea] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_cond;
     tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue;
     tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_return_output := tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_return_output;

     -- printf_uxn_opcodes_h_l73_c3_24d5[uxn_opcodes_h_l73_c3_24d5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l73_c3_24d5_uxn_opcodes_h_l73_c3_24d5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l73_c3_24d5_uxn_opcodes_h_l73_c3_24d5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_d877_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l92_c7_06ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l92_c7_06ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_iffalse := VAR_t8_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l92_c7_06ea_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l72_c2_7802] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output;

     -- t8_MUX[uxn_opcodes_h_l72_c2_7802] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l72_c2_7802_cond <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_cond;
     t8_MUX_uxn_opcodes_h_l72_c2_7802_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_iftrue;
     t8_MUX_uxn_opcodes_h_l72_c2_7802_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_return_output := t8_MUX_uxn_opcodes_h_l72_c2_7802_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l88_c7_6fee] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l88_c7_6fee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_cond;
     tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_return_output := tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l95_c42_520f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l88_c7_6fee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l95_c22_01df_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l95_c42_520f_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l88_c7_6fee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l88_c7_6fee_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l72_c2_7802_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l88_c7_6fee_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l83_c7_2692] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l83_c7_2692] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l83_c7_2692_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_cond;
     tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iftrue;
     tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_return_output := tmp16_MUX_uxn_opcodes_h_l83_c7_2692_return_output;

     -- MUX[uxn_opcodes_h_l95_c22_01df] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l95_c22_01df_cond <= VAR_MUX_uxn_opcodes_h_l95_c22_01df_cond;
     MUX_uxn_opcodes_h_l95_c22_01df_iftrue <= VAR_MUX_uxn_opcodes_h_l95_c22_01df_iftrue;
     MUX_uxn_opcodes_h_l95_c22_01df_iffalse <= VAR_MUX_uxn_opcodes_h_l95_c22_01df_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l95_c22_01df_return_output := MUX_uxn_opcodes_h_l95_c22_01df_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l83_c7_2692] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue := VAR_MUX_uxn_opcodes_h_l95_c22_01df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l83_c7_2692_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l83_c7_2692_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l83_c7_2692_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_8a7d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l92_c7_06ea] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_cond;
     result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_return_output := result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_8a7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l77_c7_8a7d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_cond;
     tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output := tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l92_c7_06ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l72_c2_7802] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l72_c2_7802_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_cond;
     tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iftrue;
     tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_return_output := tmp16_MUX_uxn_opcodes_h_l72_c2_7802_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l88_c7_6fee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_cond;
     result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_return_output := result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l72_c2_7802] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l72_c2_7802] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l88_c7_6fee_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_7802_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l83_c7_2692] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_cond;
     result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_return_output := result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l83_c7_2692_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l77_c7_8a7d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output := result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_8a7d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l72_c2_7802] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_cond;
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_return_output := result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l102_l67_DUPLICATE_9728 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l102_l67_DUPLICATE_9728_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4c49(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_7802_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_7802_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l102_l67_DUPLICATE_9728_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4c49_uxn_opcodes_h_l102_l67_DUPLICATE_9728_return_output;
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
