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
-- Submodules: 82
entity jsi_0CLK_a05d6369 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_a05d6369;
architecture arch of jsi_0CLK_a05d6369 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l154_c6_cf09]
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l154_c1_b86a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l154_c2_60c5]
signal tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l154_c2_60c5]
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c2_60c5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c2_60c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c2_60c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l154_c2_60c5]
signal result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l154_c2_60c5]
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l154_c2_60c5]
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l154_c2_60c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l154_c2_60c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l154_c2_60c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l155_c3_c064[uxn_opcodes_h_l155_c3_c064]
signal printf_uxn_opcodes_h_l155_c3_c064_uxn_opcodes_h_l155_c3_c064_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l158_c11_8060]
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l161_c11_fce0]
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l161_c7_8897]
signal tmp16_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_8897]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l161_c7_8897]
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l161_c7_8897]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l161_c7_8897]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l161_c7_8897]
signal result_pc_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l161_c7_8897]
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l161_c7_8897]
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l161_c7_8897]
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_8897]
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l167_c11_036f]
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l167_c7_4e66]
signal tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l167_c7_4e66]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l167_c7_4e66]
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l167_c7_4e66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l167_c7_4e66]
signal result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l167_c7_4e66]
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l167_c7_4e66]
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l167_c7_4e66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l167_c7_4e66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l169_c34_bf0b]
signal CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_7660]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_c0d0]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_c0d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_c0d0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_c0d0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_c0d0]
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l171_c7_c0d0]
signal result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_c0d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l176_c11_bdd4]
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l176_c7_1ed4]
signal tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l176_c7_1ed4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_1ed4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l176_c7_1ed4]
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l176_c7_1ed4]
signal result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_1ed4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l179_c11_3767]
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l179_c7_5143]
signal tmp16_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l179_c7_5143]
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_5143]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l179_c7_5143]
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l179_c7_5143]
signal result_pc_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_5143]
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l181_c3_962e]
signal CONST_SL_8_uxn_opcodes_h_l181_c3_962e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l181_c3_962e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l182_c21_617b]
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l184_c11_9b6c]
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l184_c7_f475]
signal tmp16_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l184_c7_f475]
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l184_c7_f475]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l184_c7_f475]
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l184_c7_f475]
signal result_pc_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l184_c7_f475]
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l185_c21_6ccb]
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l187_c11_3431]
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l187_c7_c8c7]
signal tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l187_c7_c8c7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l187_c7_c8c7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l187_c7_c8c7]
signal result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l187_c7_c8c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l188_c3_6b22]
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_0709]
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_35f0]
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_30b8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.pc := ref_toks_5;
      base.stack_value := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_write := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09
BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_left,
BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_right,
BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l154_c2_60c5
tmp16_MUX_uxn_opcodes_h_l154_c2_60c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_cond,
tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue,
tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse,
tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l154_c2_60c5
result_pc_MUX_uxn_opcodes_h_l154_c2_60c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_cond,
result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue,
result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse,
result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5
result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_cond,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

-- printf_uxn_opcodes_h_l155_c3_c064_uxn_opcodes_h_l155_c3_c064
printf_uxn_opcodes_h_l155_c3_c064_uxn_opcodes_h_l155_c3_c064 : entity work.printf_uxn_opcodes_h_l155_c3_c064_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l155_c3_c064_uxn_opcodes_h_l155_c3_c064_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_left,
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_right,
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0
BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_left,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_right,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l161_c7_8897
tmp16_MUX_uxn_opcodes_h_l161_c7_8897 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l161_c7_8897_cond,
tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iftrue,
tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iffalse,
tmp16_MUX_uxn_opcodes_h_l161_c7_8897_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_cond,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_return_output);

-- result_pc_MUX_uxn_opcodes_h_l161_c7_8897
result_pc_MUX_uxn_opcodes_h_l161_c7_8897 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l161_c7_8897_cond,
result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iftrue,
result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iffalse,
result_pc_MUX_uxn_opcodes_h_l161_c7_8897_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897
result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_cond,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f
BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_left,
BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_right,
BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l167_c7_4e66
tmp16_MUX_uxn_opcodes_h_l167_c7_4e66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_cond,
tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue,
tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse,
tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_cond,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_return_output);

-- result_pc_MUX_uxn_opcodes_h_l167_c7_4e66
result_pc_MUX_uxn_opcodes_h_l167_c7_4e66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_cond,
result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue,
result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse,
result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66
result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_cond,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_return_output);

-- CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b
CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_x,
CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660
BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0
tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output);

-- result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0
result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_cond,
result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue,
result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse,
result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4
BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_left,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_right,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4
tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_cond,
tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue,
tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse,
tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4
result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_cond,
result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue,
result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse,
result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767
BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_left,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_right,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output);

-- tmp16_MUX_uxn_opcodes_h_l179_c7_5143
tmp16_MUX_uxn_opcodes_h_l179_c7_5143 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l179_c7_5143_cond,
tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iftrue,
tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iffalse,
tmp16_MUX_uxn_opcodes_h_l179_c7_5143_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_cond,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_return_output);

-- result_pc_MUX_uxn_opcodes_h_l179_c7_5143
result_pc_MUX_uxn_opcodes_h_l179_c7_5143 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l179_c7_5143_cond,
result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iftrue,
result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iffalse,
result_pc_MUX_uxn_opcodes_h_l179_c7_5143_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_return_output);

-- CONST_SL_8_uxn_opcodes_h_l181_c3_962e
CONST_SL_8_uxn_opcodes_h_l181_c3_962e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l181_c3_962e_x,
CONST_SL_8_uxn_opcodes_h_l181_c3_962e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_left,
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_right,
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c
BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_left,
BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_right,
BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l184_c7_f475
tmp16_MUX_uxn_opcodes_h_l184_c7_f475 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l184_c7_f475_cond,
tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iftrue,
tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iffalse,
tmp16_MUX_uxn_opcodes_h_l184_c7_f475_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_cond,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_return_output);

-- result_pc_MUX_uxn_opcodes_h_l184_c7_f475
result_pc_MUX_uxn_opcodes_h_l184_c7_f475 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l184_c7_f475_cond,
result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iftrue,
result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iffalse,
result_pc_MUX_uxn_opcodes_h_l184_c7_f475_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_left,
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_right,
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431
BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_left,
BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_right,
BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_return_output);

-- tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7
tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_cond,
tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output);

-- result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7
result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_cond,
result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue,
result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse,
result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22
BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_left,
BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_right,
BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_left,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_right,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_left,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_right,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_return_output,
 tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
 result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output,
 tmp16_MUX_uxn_opcodes_h_l161_c7_8897_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_return_output,
 result_pc_MUX_uxn_opcodes_h_l161_c7_8897_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output,
 tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_return_output,
 result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_return_output,
 CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output,
 result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output,
 tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output,
 result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output,
 tmp16_MUX_uxn_opcodes_h_l179_c7_5143_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_return_output,
 result_pc_MUX_uxn_opcodes_h_l179_c7_5143_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_return_output,
 CONST_SL_8_uxn_opcodes_h_l181_c3_962e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l184_c7_f475_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_return_output,
 result_pc_MUX_uxn_opcodes_h_l184_c7_f475_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_return_output,
 tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output,
 result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l158_c3_d972 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_59a4 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_60c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l155_c3_c064_uxn_opcodes_h_l155_c3_c064_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_d481 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_8897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_b111_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_a821 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_33e4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l182_c3_0f2b : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_962e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_962e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l185_c3_c879 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l191_c3_8330 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_1a12_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l176_l171_l167_l161_l154_l184_l179_DUPLICATE_4ecc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_7e8a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l154_l184_l179_DUPLICATE_e6a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_46f7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l176_l167_l161_l187_l154_l184_l179_DUPLICATE_aafa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_5ddf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l184_l179_DUPLICATE_6121_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l180_l188_DUPLICATE_d7ea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30b8_uxn_opcodes_h_l150_l198_DUPLICATE_9085_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_d481 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_d481;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_a821 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_a821;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iffalse := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_59a4 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_59a4;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_right := to_unsigned(6, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l154_c6_cf09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_left;
     BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output := BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_7e8a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_7e8a_return_output := result.stack_address_sp_offset;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l161_c7_8897] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_8897_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l185_c21_6ccb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_7660] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l176_l167_l161_l187_l154_l184_l179_DUPLICATE_aafa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l176_l167_l161_l187_l154_l184_l179_DUPLICATE_aafa_return_output := result.is_ram_read;

     -- BIN_OP_PLUS[uxn_opcodes_h_l182_c21_617b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l187_c11_3431] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_left;
     BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_return_output := BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l167_c11_036f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_left;
     BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output := BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l169_c34_bf0b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_return_output := CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l179_c11_3767] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_left;
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output := BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l154_l184_l179_DUPLICATE_e6a3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l154_l184_l179_DUPLICATE_e6a3_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l184_l179_DUPLICATE_6121 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l184_l179_DUPLICATE_6121_return_output := result.is_opc_done;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_60c5_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l180_l188_DUPLICATE_d7ea LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l180_l188_DUPLICATE_d7ea_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l161_c11_fce0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_left;
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output := BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l176_l171_l167_l161_l154_l184_l179_DUPLICATE_4ecc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l176_l171_l167_l161_l154_l184_l179_DUPLICATE_4ecc_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_1a12 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_1a12_return_output := result.ram_addr;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l165_c24_b111] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_b111_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_5ddf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_5ddf_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l158_c11_8060] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_left;
     BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_return_output := BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_46f7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_46f7_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l176_c11_bdd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_left;
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output := BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l184_c11_9b6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_cf09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_fce0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_036f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_7660_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_bdd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_3767_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_9b6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_3431_return_output;
     VAR_tmp16_uxn_opcodes_h_l158_c3_d972 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_8060_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l182_c3_0f2b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_617b_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l185_c3_c879 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_6ccb_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l180_l188_DUPLICATE_d7ea_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_962e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l180_l188_DUPLICATE_d7ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_b111_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l154_l184_l179_DUPLICATE_e6a3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l154_l184_l179_DUPLICATE_e6a3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l154_l184_l179_DUPLICATE_e6a3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l154_l184_l179_DUPLICATE_e6a3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l154_l184_l179_DUPLICATE_e6a3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l154_l184_l179_DUPLICATE_e6a3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l154_l184_l179_DUPLICATE_e6a3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l154_l184_l179_DUPLICATE_e6a3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_1a12_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_1a12_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_1a12_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l184_l161_l167_l154_DUPLICATE_1a12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l184_l179_DUPLICATE_6121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l184_l179_DUPLICATE_6121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l184_l179_DUPLICATE_6121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l184_l179_DUPLICATE_6121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l184_l179_DUPLICATE_6121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l184_l179_DUPLICATE_6121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l176_l171_l167_l161_l187_l184_l179_DUPLICATE_6121_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l176_l171_l167_l161_l154_l184_l179_DUPLICATE_4ecc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l176_l171_l167_l161_l154_l184_l179_DUPLICATE_4ecc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l176_l171_l167_l161_l154_l184_l179_DUPLICATE_4ecc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l176_l171_l167_l161_l154_l184_l179_DUPLICATE_4ecc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l176_l171_l167_l161_l154_l184_l179_DUPLICATE_4ecc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l176_l171_l167_l161_l154_l184_l179_DUPLICATE_4ecc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l176_l171_l167_l161_l154_l184_l179_DUPLICATE_4ecc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l176_l167_l161_l187_l154_l184_l179_DUPLICATE_aafa_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l176_l167_l161_l187_l154_l184_l179_DUPLICATE_aafa_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l176_l167_l161_l187_l154_l184_l179_DUPLICATE_aafa_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l176_l167_l161_l187_l154_l184_l179_DUPLICATE_aafa_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l176_l167_l161_l187_l154_l184_l179_DUPLICATE_aafa_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l176_l167_l161_l187_l154_l184_l179_DUPLICATE_aafa_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l176_l167_l161_l187_l154_l184_l179_DUPLICATE_aafa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_5ddf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_5ddf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_5ddf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_7e8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_7e8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_46f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_46f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_8897_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_60c5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l182_c3_0f2b;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l185_c3_c879;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue := VAR_tmp16_uxn_opcodes_h_l158_c3_d972;
     -- BIN_OP_OR[uxn_opcodes_h_l188_c3_6b22] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_left;
     BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_return_output := BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l187_c7_c8c7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_c0d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l184_c7_f475] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_return_output := result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l169_c24_33e4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_33e4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_bf0b_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l167_c7_4e66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l187_c7_c8c7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l161_c7_8897] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l187_c7_c8c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l181_c3_962e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l181_c3_962e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_962e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_962e_return_output := CONST_SL_8_uxn_opcodes_h_l181_c3_962e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l154_c1_b86a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_right := VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_6b22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_33e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_962e_return_output;
     VAR_printf_uxn_opcodes_h_l155_c3_c064_uxn_opcodes_h_l155_c3_c064_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_b86a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_8897_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_f475_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_0709] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_left;
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_return_output := BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l184_c7_f475] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_return_output;

     -- printf_uxn_opcodes_h_l155_c3_c064[uxn_opcodes_h_l155_c3_c064] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l155_c3_c064_uxn_opcodes_h_l155_c3_c064_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l155_c3_c064_uxn_opcodes_h_l155_c3_c064_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l167_c7_4e66] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_cond;
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_return_output := result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l161_c7_8897] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l167_c7_4e66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l179_c7_5143] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_return_output := result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l184_c7_f475] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l187_c7_c8c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_cond;
     tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output := tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l184_c7_f475] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_0709_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_f475_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_f475_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_f475_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_5143_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_8897_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l161_c7_8897] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_cond;
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_return_output := result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_35f0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l184_c7_f475] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l184_c7_f475_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_cond;
     tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iftrue;
     tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_return_output := tmp16_MUX_uxn_opcodes_h_l184_c7_f475_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l161_c7_8897] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_5143] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l179_c7_5143] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l176_c7_1ed4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_5143] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l191_c3_8330 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_35f0_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_5143_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_5143_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_5143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_8897_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_8897_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_f475_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue := VAR_result_pc_uxn_opcodes_h_l191_c3_8330;
     -- result_stack_value_MUX[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_return_output := result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l176_c7_1ed4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_1ed4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l179_c7_5143] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l179_c7_5143_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_cond;
     tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iftrue;
     tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_return_output := tmp16_MUX_uxn_opcodes_h_l179_c7_5143_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l187_c7_c8c7] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_cond;
     result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iftrue;
     result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output := result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_1ed4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_c0d0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_c8c7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_5143_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l176_c7_1ed4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_cond;
     tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output := tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l184_c7_f475] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l184_c7_f475_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_cond;
     result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iftrue;
     result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_return_output := result_pc_MUX_uxn_opcodes_h_l184_c7_f475_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_c0d0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l167_c7_4e66] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_return_output := result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_c0d0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_c0d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_f475_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l167_c7_4e66] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l167_c7_4e66] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l179_c7_5143] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l179_c7_5143_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_cond;
     result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iftrue;
     result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_return_output := result_pc_MUX_uxn_opcodes_h_l179_c7_5143_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l161_c7_8897] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_return_output := result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l167_c7_4e66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_c0d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_5143_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_8897_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_8897] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l176_c7_1ed4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_cond;
     result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output := result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l161_c7_8897] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_8897] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l167_c7_4e66] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_cond;
     tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue;
     tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_return_output := tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_8897_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_8897_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_8897_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_1ed4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l161_c7_8897] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l161_c7_8897_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_cond;
     tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iftrue;
     tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_return_output := tmp16_MUX_uxn_opcodes_h_l161_c7_8897_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l171_c7_c0d0] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_cond;
     result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iftrue;
     result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output := result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_c0d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_8897_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_cond;
     tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_return_output := tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l167_c7_4e66] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_cond;
     result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iftrue;
     result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_return_output := result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_4e66_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l161_c7_8897] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l161_c7_8897_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_cond;
     result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iftrue;
     result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_return_output := result_pc_MUX_uxn_opcodes_h_l161_c7_8897_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_8897_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l154_c2_60c5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_cond;
     result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_return_output := result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_30b8_uxn_opcodes_h_l150_l198_DUPLICATE_9085 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30b8_uxn_opcodes_h_l150_l198_DUPLICATE_9085_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_30b8(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_60c5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_60c5_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30b8_uxn_opcodes_h_l150_l198_DUPLICATE_9085_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_30b8_uxn_opcodes_h_l150_l198_DUPLICATE_9085_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
