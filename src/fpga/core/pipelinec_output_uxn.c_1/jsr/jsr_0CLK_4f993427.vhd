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
-- BIN_OP_EQ[uxn_opcodes_h_l764_c6_7211]
signal BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l764_c1_82f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l764_c2_d9c6]
signal t8_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l764_c2_d9c6]
signal result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l764_c2_d9c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l764_c2_d9c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l764_c2_d9c6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l764_c2_d9c6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l764_c2_d9c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l764_c2_d9c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l764_c2_d9c6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l764_c2_d9c6]
signal result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l765_c3_bd54[uxn_opcodes_h_l765_c3_bd54]
signal printf_uxn_opcodes_h_l765_c3_bd54_uxn_opcodes_h_l765_c3_bd54_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l769_c11_e99b]
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l769_c7_cd36]
signal t8_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l769_c7_cd36]
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l769_c7_cd36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l769_c7_cd36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l769_c7_cd36]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l769_c7_cd36]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l769_c7_cd36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l769_c7_cd36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l769_c7_cd36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l769_c7_cd36]
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l772_c11_6956]
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l772_c7_eb39]
signal t8_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l772_c7_eb39]
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_eb39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_eb39]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l772_c7_eb39]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l772_c7_eb39]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l772_c7_eb39]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_eb39]
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l772_c7_eb39]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l772_c7_eb39]
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l775_c30_3c3e]
signal sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l777_c11_e6ef]
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l777_c7_9238]
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_9238]
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_9238]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_9238]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_9238]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l777_c7_9238]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_9238]
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_9238]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l777_c7_9238]
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l784_c11_5320]
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l784_c7_3aa1]
signal result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_3aa1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l784_c7_3aa1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_3aa1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_3aa1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_3aa1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l784_c7_3aa1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l784_c7_3aa1]
signal result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l787_c31_70b4]
signal CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l789_c22_415a]
signal BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l791_c11_d901]
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l791_c7_0061]
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l791_c7_0061]
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l791_c7_0061]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l791_c7_0061]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_fb40( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.u16_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211
BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_left,
BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_right,
BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_return_output);

-- t8_MUX_uxn_opcodes_h_l764_c2_d9c6
t8_MUX_uxn_opcodes_h_l764_c2_d9c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l764_c2_d9c6_cond,
t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue,
t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse,
t8_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6
result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond,
result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6
result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6
result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6
result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond,
result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output);

-- printf_uxn_opcodes_h_l765_c3_bd54_uxn_opcodes_h_l765_c3_bd54
printf_uxn_opcodes_h_l765_c3_bd54_uxn_opcodes_h_l765_c3_bd54 : entity work.printf_uxn_opcodes_h_l765_c3_bd54_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l765_c3_bd54_uxn_opcodes_h_l765_c3_bd54_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b
BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_left,
BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_right,
BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output);

-- t8_MUX_uxn_opcodes_h_l769_c7_cd36
t8_MUX_uxn_opcodes_h_l769_c7_cd36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l769_c7_cd36_cond,
t8_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue,
t8_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse,
t8_MUX_uxn_opcodes_h_l769_c7_cd36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36
result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond,
result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36
result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond,
result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956
BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_left,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_right,
BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output);

-- t8_MUX_uxn_opcodes_h_l772_c7_eb39
t8_MUX_uxn_opcodes_h_l772_c7_eb39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l772_c7_eb39_cond,
t8_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue,
t8_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse,
t8_MUX_uxn_opcodes_h_l772_c7_eb39_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39
result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond,
result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39
result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond,
result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output);

-- sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e
sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_ins,
sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_x,
sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_y,
sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef
BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_left,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_right,
BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238
result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_cond,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238
result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_cond,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320
BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_left,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_right,
BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1
result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond,
result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1
result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond,
result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l787_c31_70b4
CONST_SR_8_uxn_opcodes_h_l787_c31_70b4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_x,
CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a
BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_left,
BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_right,
BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901
BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_left,
BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_right,
BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_return_output,
 t8_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output,
 t8_MUX_uxn_opcodes_h_l769_c7_cd36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output,
 t8_MUX_uxn_opcodes_h_l772_c7_eb39_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output,
 sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output,
 CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l766_c3_f099 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l765_c3_bd54_uxn_opcodes_h_l765_c3_bd54_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l770_c3_9365 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l781_c3_1a10 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_46a0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l782_c21_9b11_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_d925 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l789_c3_0088 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l787_c21_94a2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l789_c27_4cb4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l769_l764_l772_DUPLICATE_ef2e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l764_l772_l769_l791_DUPLICATE_173e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_d0fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l769_l764_DUPLICATE_78f9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_4d6e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l769_l764_DUPLICATE_2c80_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l784_l777_l764_l772_l769_DUPLICATE_c200_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l784_l777_l772_l769_l791_DUPLICATE_f2a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l784_l772_DUPLICATE_17ed_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fb40_uxn_opcodes_h_l798_l760_DUPLICATE_8cc0_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l781_c3_1a10 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l781_c3_1a10;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_d925 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l786_c3_d925;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_46a0 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_46a0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l766_c3_f099 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l766_c3_f099;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l770_c3_9365 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l770_c3_9365;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l764_c6_7211] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_left;
     BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output := BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l769_l764_DUPLICATE_2c80 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l769_l764_DUPLICATE_2c80_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l769_l764_l772_DUPLICATE_ef2e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l769_l764_l772_DUPLICATE_ef2e_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_d0fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_d0fb_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l777_c11_e6ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l791_c11_d901] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_left;
     BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_return_output := BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l775_c30_3c3e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_ins;
     sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_x;
     sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_return_output := sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l772_c11_6956] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_left;
     BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output := BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l764_l772_l769_l791_DUPLICATE_173e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l764_l772_l769_l791_DUPLICATE_173e_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l769_l764_DUPLICATE_78f9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l769_l764_DUPLICATE_78f9_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l789_c27_4cb4] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l789_c27_4cb4_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l784_l777_l764_l772_l769_DUPLICATE_c200 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l784_l777_l764_l772_l769_DUPLICATE_c200_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l784_c11_5320] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_left;
     BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output := BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l787_c31_70b4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_return_output := CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l782_c21_9b11] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l782_c21_9b11_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l769_c11_e99b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_left;
     BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output := BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l784_l772_DUPLICATE_17ed LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l784_l772_DUPLICATE_17ed_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_4d6e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_4d6e_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l784_l777_l772_l769_l791_DUPLICATE_f2a5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l784_l777_l772_l769_l791_DUPLICATE_f2a5_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l764_c6_7211_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l769_c11_e99b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l772_c11_6956_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l777_c11_e6ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l784_c11_5320_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l791_c11_d901_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l789_c27_4cb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l782_c21_9b11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l769_l764_DUPLICATE_78f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l769_l764_DUPLICATE_78f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l777_l769_l764_DUPLICATE_78f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l784_l777_l764_l772_l769_DUPLICATE_c200_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l784_l777_l764_l772_l769_DUPLICATE_c200_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l784_l777_l764_l772_l769_DUPLICATE_c200_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l784_l777_l764_l772_l769_DUPLICATE_c200_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l784_l777_l764_l772_l769_DUPLICATE_c200_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l784_l777_l772_l769_l791_DUPLICATE_f2a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l784_l777_l772_l769_l791_DUPLICATE_f2a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l784_l777_l772_l769_l791_DUPLICATE_f2a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l784_l777_l772_l769_l791_DUPLICATE_f2a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l784_l777_l772_l769_l791_DUPLICATE_f2a5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l764_l772_l769_l791_DUPLICATE_173e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l764_l772_l769_l791_DUPLICATE_173e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l764_l772_l769_l791_DUPLICATE_173e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l764_l772_l769_l791_DUPLICATE_173e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l777_l764_l772_l769_l791_DUPLICATE_173e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l769_l764_DUPLICATE_2c80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l769_l764_DUPLICATE_2c80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l769_l764_DUPLICATE_2c80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l777_l784_l769_l764_DUPLICATE_2c80_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_d0fb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_d0fb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_d0fb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_d0fb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_d0fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_4d6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_4d6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_4d6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_4d6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l784_l764_l772_l769_l791_DUPLICATE_4d6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l784_l772_DUPLICATE_17ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l784_l772_DUPLICATE_17ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l769_l764_l772_DUPLICATE_ef2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l769_l764_l772_DUPLICATE_ef2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l769_l764_l772_DUPLICATE_ef2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l784_l769_l764_l772_DUPLICATE_ef2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l775_c30_3c3e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l777_c7_9238] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output;

     -- t8_MUX[uxn_opcodes_h_l772_c7_eb39] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l772_c7_eb39_cond <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_cond;
     t8_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue;
     t8_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_return_output := t8_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l791_c7_0061] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l764_c1_82f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l784_c7_3aa1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l789_c22_415a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l791_c7_0061] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l787_c21_94a2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l787_c21_94a2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l787_c31_70b4_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l791_c7_0061] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l791_c7_0061] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l784_c7_3aa1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l789_c3_0088 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l789_c22_415a_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l787_c21_94a2_return_output;
     VAR_printf_uxn_opcodes_h_l765_c3_bd54_uxn_opcodes_h_l765_c3_bd54_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l764_c1_82f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l791_c7_0061_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l791_c7_0061_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l791_c7_0061_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l791_c7_0061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse := VAR_t8_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue := VAR_result_u16_value_uxn_opcodes_h_l789_c3_0088;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l777_c7_9238] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_return_output;

     -- printf_uxn_opcodes_h_l765_c3_bd54[uxn_opcodes_h_l765_c3_bd54] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l765_c3_bd54_uxn_opcodes_h_l765_c3_bd54_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l765_c3_bd54_uxn_opcodes_h_l765_c3_bd54_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l784_c7_3aa1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l784_c7_3aa1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l784_c7_3aa1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output := result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l784_c7_3aa1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output := result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;

     -- t8_MUX[uxn_opcodes_h_l769_c7_cd36] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l769_c7_cd36_cond <= VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_cond;
     t8_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue;
     t8_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_return_output := t8_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l772_c7_eb39] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l784_c7_3aa1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l777_c7_9238] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l784_c7_3aa1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l777_c7_9238_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l777_c7_9238_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l784_c7_3aa1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;
     -- t8_MUX[uxn_opcodes_h_l764_c2_d9c6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l764_c2_d9c6_cond <= VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_cond;
     t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue;
     t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output := t8_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l772_c7_eb39] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l777_c7_9238] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_cond;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output := result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l777_c7_9238] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l772_c7_eb39] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l777_c7_9238] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l777_c7_9238] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l769_c7_cd36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l777_c7_9238] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l777_c7_9238] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_cond;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output := result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l777_c7_9238_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l777_c7_9238_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l777_c7_9238_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l777_c7_9238_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l777_c7_9238_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l772_c7_eb39] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l772_c7_eb39] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond;
     result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output := result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l772_c7_eb39] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_cond;
     result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output := result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l764_c2_d9c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l772_c7_eb39] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l772_c7_eb39] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l769_c7_cd36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l772_c7_eb39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l769_c7_cd36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l772_c7_eb39_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l769_c7_cd36] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l769_c7_cd36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l764_c2_d9c6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l769_c7_cd36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output := result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l769_c7_cd36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l764_c2_d9c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l769_c7_cd36] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_cond;
     result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output := result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l769_c7_cd36] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l769_c7_cd36_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l764_c2_d9c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l764_c2_d9c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l764_c2_d9c6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l764_c2_d9c6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l764_c2_d9c6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output := result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l764_c2_d9c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output := result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fb40_uxn_opcodes_h_l798_l760_DUPLICATE_8cc0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fb40_uxn_opcodes_h_l798_l760_DUPLICATE_8cc0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fb40(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l764_c2_d9c6_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fb40_uxn_opcodes_h_l798_l760_DUPLICATE_8cc0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fb40_uxn_opcodes_h_l798_l760_DUPLICATE_8cc0_return_output;
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
