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
-- Submodules: 57
entity jci_0CLK_edc09f97 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_edc09f97;
architecture arch of jci_0CLK_edc09f97 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l72_c6_9556]
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l72_c1_b27d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l72_c2_9bec]
signal t8_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l72_c2_9bec]
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l72_c2_9bec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l72_c2_9bec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l72_c2_9bec]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l72_c2_9bec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l72_c2_9bec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l72_c2_9bec]
signal tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l73_c3_2b43[uxn_opcodes_h_l73_c3_2b43]
signal printf_uxn_opcodes_h_l73_c3_2b43_uxn_opcodes_h_l73_c3_2b43_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l77_c11_5adf]
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l77_c7_45bd]
signal t8_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l77_c7_45bd]
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c7_45bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_45bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_45bd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_45bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_45bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l77_c7_45bd]
signal tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l80_c11_cb9c]
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l80_c7_bf48]
signal t8_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l80_c7_bf48]
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l80_c7_bf48]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l80_c7_bf48]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l80_c7_bf48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l80_c7_bf48]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l80_c7_bf48]
signal tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l86_c11_3288]
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l86_c7_b41e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_b41e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_b41e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l86_c7_b41e]
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l86_c7_b41e]
signal tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_1967]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_3aa0]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_46d8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_46d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_46d8]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_46d8]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l92_c3_0365]
signal CONST_SL_8_uxn_opcodes_h_l92_c3_0365_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l92_c3_0365_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l94_c11_fa19]
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_97b5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_97b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l94_c7_97b5]
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l94_c7_97b5]
signal tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l95_c3_ea3b]
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l97_c22_2637]
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_2255]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_a0ce]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_3484]
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l97_c22_23ab]
signal MUX_uxn_opcodes_h_l97_c22_23ab_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_23ab_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_23ab_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l97_c22_23ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c11_f070]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_a8c1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_a8c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6245( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556
BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_left,
BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_right,
BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_return_output);

-- t8_MUX_uxn_opcodes_h_l72_c2_9bec
t8_MUX_uxn_opcodes_h_l72_c2_9bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l72_c2_9bec_cond,
t8_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue,
t8_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse,
t8_MUX_uxn_opcodes_h_l72_c2_9bec_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec
result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_cond,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l72_c2_9bec
tmp16_MUX_uxn_opcodes_h_l72_c2_9bec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_cond,
tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue,
tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse,
tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_return_output);

-- printf_uxn_opcodes_h_l73_c3_2b43_uxn_opcodes_h_l73_c3_2b43
printf_uxn_opcodes_h_l73_c3_2b43_uxn_opcodes_h_l73_c3_2b43 : entity work.printf_uxn_opcodes_h_l73_c3_2b43_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l73_c3_2b43_uxn_opcodes_h_l73_c3_2b43_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf
BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_left,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_right,
BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output);

-- t8_MUX_uxn_opcodes_h_l77_c7_45bd
t8_MUX_uxn_opcodes_h_l77_c7_45bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l77_c7_45bd_cond,
t8_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue,
t8_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse,
t8_MUX_uxn_opcodes_h_l77_c7_45bd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd
result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_cond,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l77_c7_45bd
tmp16_MUX_uxn_opcodes_h_l77_c7_45bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_cond,
tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c
BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_left,
BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_right,
BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output);

-- t8_MUX_uxn_opcodes_h_l80_c7_bf48
t8_MUX_uxn_opcodes_h_l80_c7_bf48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l80_c7_bf48_cond,
t8_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue,
t8_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse,
t8_MUX_uxn_opcodes_h_l80_c7_bf48_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48
result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_cond,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output);

-- tmp16_MUX_uxn_opcodes_h_l80_c7_bf48
tmp16_MUX_uxn_opcodes_h_l80_c7_bf48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_cond,
tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue,
tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse,
tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288
BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_left,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_right,
BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e
result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_cond,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l86_c7_b41e
tmp16_MUX_uxn_opcodes_h_l86_c7_b41e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_cond,
tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue,
tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse,
tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0
BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8
result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_46d8
tmp16_MUX_uxn_opcodes_h_l90_c7_46d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_return_output);

-- CONST_SL_8_uxn_opcodes_h_l92_c3_0365
CONST_SL_8_uxn_opcodes_h_l92_c3_0365 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l92_c3_0365_x,
CONST_SL_8_uxn_opcodes_h_l92_c3_0365_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19
BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_left,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_right,
BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5
result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_cond,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l94_c7_97b5
tmp16_MUX_uxn_opcodes_h_l94_c7_97b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_cond,
tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue,
tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse,
tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b
BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_left,
BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_right,
BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637
BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_left,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_right,
BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_left,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_right,
BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_return_output);

-- MUX_uxn_opcodes_h_l97_c22_23ab
MUX_uxn_opcodes_h_l97_c22_23ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l97_c22_23ab_cond,
MUX_uxn_opcodes_h_l97_c22_23ab_iftrue,
MUX_uxn_opcodes_h_l97_c22_23ab_iffalse,
MUX_uxn_opcodes_h_l97_c22_23ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070
BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_return_output,
 t8_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
 tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output,
 t8_MUX_uxn_opcodes_h_l77_c7_45bd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output,
 t8_MUX_uxn_opcodes_h_l80_c7_bf48_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output,
 tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_return_output,
 tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_return_output,
 CONST_SL_8_uxn_opcodes_h_l92_c3_0365_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_return_output,
 tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_return_output,
 MUX_uxn_opcodes_h_l97_c22_23ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_4c83 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l73_c3_2b43_uxn_opcodes_h_l73_c3_2b43_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_26c5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_45bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_8526 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_0ff3 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_0365_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_0365_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_23ab_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_23ab_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_23ab_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l97_c22_23ab_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_63cf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_8b61_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_6113_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_9c58_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_643b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l91_DUPLICATE_af1b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l104_l67_DUPLICATE_cb3a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_8526 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l83_c3_8526;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_4c83 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l74_c3_4c83;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_26c5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l78_c3_26c5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_1967] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l77_c7_45bd] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_45bd_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_8b61 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_8b61_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l77_c11_5adf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_left;
     BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output := BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c32_2255] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l97_c22_2637] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_left;
     BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_return_output := BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l72_c6_9556] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_left;
     BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output := BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c11_f070] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l86_c11_3288] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_left;
     BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_return_output := BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_3aa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l91_DUPLICATE_af1b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l91_DUPLICATE_af1b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l94_c11_fa19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_left;
     BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_return_output := BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_63cf LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_63cf_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_9c58 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_9c58_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l80_c11_cb9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_6113 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_6113_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_643b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_643b_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l72_c6_9556_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l77_c11_5adf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l80_c11_cb9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l86_c11_3288_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_3aa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c11_fa19_return_output;
     VAR_MUX_uxn_opcodes_h_l97_c22_23ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l97_c22_2637_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c11_f070_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_0ff3 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_1967_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l97_c22_23ab_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c32_2255_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l91_DUPLICATE_af1b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_0365_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l95_l91_DUPLICATE_af1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_9c58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_9c58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l72_l77_l80_DUPLICATE_9c58_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_63cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_63cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_63cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l72_l77_l90_l94_DUPLICATE_63cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_643b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_643b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_643b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_643b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_643b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l99_l94_l90_l86_l80_l77_DUPLICATE_643b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_6113_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_6113_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_6113_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_6113_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_6113_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l72_l99_l90_l86_l80_l77_DUPLICATE_6113_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_8b61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_8b61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l72_l86_l77_DUPLICATE_8b61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l77_c7_45bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_0ff3;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l72_c1_b27d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l92_c3_0365] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l92_c3_0365_x <= VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_0365_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_0365_return_output := CONST_SL_8_uxn_opcodes_h_l92_c3_0365_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l99_c7_a8c1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l95_c3_ea3b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_left;
     BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_return_output := BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l80_c7_bf48] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;

     -- t8_MUX[uxn_opcodes_h_l80_c7_bf48] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l80_c7_bf48_cond <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_cond;
     t8_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue;
     t8_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_return_output := t8_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l86_c7_b41e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l77_c7_45bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l99_c7_a8c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_right := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l95_c3_ea3b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l92_c3_0365_return_output;
     VAR_printf_uxn_opcodes_h_l73_c3_2b43_uxn_opcodes_h_l73_c3_2b43_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l72_c1_b27d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l99_c7_a8c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l86_c7_b41e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l72_c2_9bec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l94_c7_97b5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_cond;
     tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_return_output := tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l80_c7_bf48] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;

     -- t8_MUX[uxn_opcodes_h_l77_c7_45bd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l77_c7_45bd_cond <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_cond;
     t8_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue;
     t8_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_return_output := t8_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l94_c7_97b5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_a0ce] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l77_c7_45bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;

     -- printf_uxn_opcodes_h_l73_c3_2b43[uxn_opcodes_h_l73_c3_2b43] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l73_c3_2b43_uxn_opcodes_h_l73_c3_2b43_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l73_c3_2b43_uxn_opcodes_h_l73_c3_2b43_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l94_c7_97b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_a0ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l94_c7_97b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l94_c7_97b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse := VAR_t8_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l94_c7_97b5_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_46d8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_return_output;

     -- t8_MUX[uxn_opcodes_h_l72_c2_9bec] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l72_c2_9bec_cond <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_cond;
     t8_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue;
     t8_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_return_output := t8_MUX_uxn_opcodes_h_l72_c2_9bec_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l77_c7_45bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l97_c42_3484] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_left;
     BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_return_output := BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l72_c2_9bec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_46d8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_46d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l97_c22_23ab_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l97_c42_3484_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_46d8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_46d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l72_c2_9bec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_46d8_return_output;
     -- MUX[uxn_opcodes_h_l97_c22_23ab] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l97_c22_23ab_cond <= VAR_MUX_uxn_opcodes_h_l97_c22_23ab_cond;
     MUX_uxn_opcodes_h_l97_c22_23ab_iftrue <= VAR_MUX_uxn_opcodes_h_l97_c22_23ab_iftrue;
     MUX_uxn_opcodes_h_l97_c22_23ab_iffalse <= VAR_MUX_uxn_opcodes_h_l97_c22_23ab_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l97_c22_23ab_return_output := MUX_uxn_opcodes_h_l97_c22_23ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l86_c7_b41e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l86_c7_b41e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l72_c2_9bec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l86_c7_b41e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_cond;
     tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_return_output := tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue := VAR_MUX_uxn_opcodes_h_l97_c22_23ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l86_c7_b41e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l86_c7_b41e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l86_c7_b41e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l80_c7_bf48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l80_c7_bf48] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_cond;
     tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue;
     tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_return_output := tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l94_c7_97b5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_return_output := result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l80_c7_bf48] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l94_c7_97b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l77_c7_45bd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l77_c7_45bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_46d8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l77_c7_45bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_cond;
     tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_return_output := tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_46d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l86_c7_b41e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_return_output := result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l72_c2_9bec] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l72_c2_9bec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l72_c2_9bec] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_cond;
     tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue;
     tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_return_output := tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l86_c7_b41e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l72_c2_9bec_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l80_c7_bf48] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_cond;
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_return_output := result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;

     -- Submodule level 9
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l80_c7_bf48_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l77_c7_45bd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_return_output := result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;

     -- Submodule level 10
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l77_c7_45bd_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l72_c2_9bec] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_cond;
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_return_output := result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l104_l67_DUPLICATE_cb3a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l104_l67_DUPLICATE_cb3a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6245(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l72_c2_9bec_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l72_c2_9bec_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l104_l67_DUPLICATE_cb3a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6245_uxn_opcodes_h_l104_l67_DUPLICATE_cb3a_return_output;
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
