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
-- BIN_OP_EQ[uxn_opcodes_h_l154_c6_7772]
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l154_c1_aaad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l154_c2_6a8f]
signal tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c2_6a8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l154_c2_6a8f]
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l154_c2_6a8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c2_6a8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l154_c2_6a8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l154_c2_6a8f]
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l154_c2_6a8f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l154_c2_6a8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c2_6a8f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l154_c2_6a8f]
signal result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l155_c3_14b0[uxn_opcodes_h_l155_c3_14b0]
signal printf_uxn_opcodes_h_l155_c3_14b0_uxn_opcodes_h_l155_c3_14b0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l158_c11_b99e]
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l161_c11_85ff]
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l161_c7_c773]
signal tmp16_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l161_c7_c773]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l161_c7_c773]
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l161_c7_c773]
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l161_c7_c773]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_c773]
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l161_c7_c773]
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l161_c7_c773]
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_c773]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l161_c7_c773]
signal result_pc_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l167_c11_12e8]
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l167_c7_deb8]
signal tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l167_c7_deb8]
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l167_c7_deb8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l167_c7_deb8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l167_c7_deb8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l167_c7_deb8]
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l167_c7_deb8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l167_c7_deb8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l167_c7_deb8]
signal result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l169_c34_9596]
signal CONST_SR_8_uxn_opcodes_h_l169_c34_9596_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l169_c34_9596_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_4132]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_f647]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_f647]
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_f647]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_f647]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_f647]
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_f647]
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l171_c7_f647]
signal result_pc_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l176_c11_756c]
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l176_c7_28bb]
signal tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l176_c7_28bb]
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_28bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_28bb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l176_c7_28bb]
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l176_c7_28bb]
signal result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l179_c11_9546]
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l179_c7_c0a2]
signal tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l179_c7_c0a2]
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_c0a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_c0a2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l179_c7_c0a2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l179_c7_c0a2]
signal result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l181_c3_f16d]
signal CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l182_c21_861e]
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l184_c11_5351]
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l184_c7_bbe3]
signal tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l184_c7_bbe3]
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l184_c7_bbe3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l184_c7_bbe3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l184_c7_bbe3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l184_c7_bbe3]
signal result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l185_c21_9c80]
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l187_c11_6c60]
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l187_c7_580f]
signal tmp16_MUX_uxn_opcodes_h_l187_c7_580f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l187_c7_580f_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l187_c7_580f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l187_c7_580f]
signal result_pc_MUX_uxn_opcodes_h_l187_c7_580f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l187_c7_580f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l187_c7_580f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l187_c7_580f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l188_c3_0737]
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_619d]
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_9f07]
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_return_output : unsigned(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6cad( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
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
      base.sp_relative_shift := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.pc := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772
BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_left,
BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_right,
BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f
tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_cond,
tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue,
tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse,
tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f
result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_cond,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f
result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_cond,
result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue,
result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse,
result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

-- printf_uxn_opcodes_h_l155_c3_14b0_uxn_opcodes_h_l155_c3_14b0
printf_uxn_opcodes_h_l155_c3_14b0_uxn_opcodes_h_l155_c3_14b0 : entity work.printf_uxn_opcodes_h_l155_c3_14b0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l155_c3_14b0_uxn_opcodes_h_l155_c3_14b0_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_left,
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_right,
BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff
BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_left,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_right,
BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l161_c7_c773
tmp16_MUX_uxn_opcodes_h_l161_c7_c773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l161_c7_c773_cond,
tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iftrue,
tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iffalse,
tmp16_MUX_uxn_opcodes_h_l161_c7_c773_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773
result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_cond,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_cond,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_return_output);

-- result_pc_MUX_uxn_opcodes_h_l161_c7_c773
result_pc_MUX_uxn_opcodes_h_l161_c7_c773 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l161_c7_c773_cond,
result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iftrue,
result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iffalse,
result_pc_MUX_uxn_opcodes_h_l161_c7_c773_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8
BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_left,
BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_right,
BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l167_c7_deb8
tmp16_MUX_uxn_opcodes_h_l167_c7_deb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_cond,
tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue,
tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse,
tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8
result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_cond,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_return_output);

-- result_pc_MUX_uxn_opcodes_h_l167_c7_deb8
result_pc_MUX_uxn_opcodes_h_l167_c7_deb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_cond,
result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue,
result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse,
result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l169_c34_9596
CONST_SR_8_uxn_opcodes_h_l169_c34_9596 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l169_c34_9596_x,
CONST_SR_8_uxn_opcodes_h_l169_c34_9596_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132
BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_f647
tmp16_MUX_uxn_opcodes_h_l171_c7_f647 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_f647_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_f647_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_cond,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_return_output);

-- result_pc_MUX_uxn_opcodes_h_l171_c7_f647
result_pc_MUX_uxn_opcodes_h_l171_c7_f647 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l171_c7_f647_cond,
result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iftrue,
result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iffalse,
result_pc_MUX_uxn_opcodes_h_l171_c7_f647_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c
BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_left,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_right,
BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l176_c7_28bb
tmp16_MUX_uxn_opcodes_h_l176_c7_28bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_cond,
tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue,
tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse,
tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l176_c7_28bb
result_pc_MUX_uxn_opcodes_h_l176_c7_28bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_cond,
result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue,
result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse,
result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546
BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_left,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_right,
BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output);

-- tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2
tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_cond,
tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue,
tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse,
tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2
result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_cond,
result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue,
result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse,
result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output);

-- CONST_SL_8_uxn_opcodes_h_l181_c3_f16d
CONST_SL_8_uxn_opcodes_h_l181_c3_f16d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_x,
CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_left,
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_right,
BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351
BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_left,
BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_right,
BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output);

-- tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3
tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_cond,
tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue,
tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse,
tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output);

-- result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3
result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_cond,
result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue,
result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse,
result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_left,
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_right,
BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60
BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_left,
BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_right,
BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_return_output);

-- tmp16_MUX_uxn_opcodes_h_l187_c7_580f
tmp16_MUX_uxn_opcodes_h_l187_c7_580f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l187_c7_580f_cond,
tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iftrue,
tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iffalse,
tmp16_MUX_uxn_opcodes_h_l187_c7_580f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l187_c7_580f
result_pc_MUX_uxn_opcodes_h_l187_c7_580f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l187_c7_580f_cond,
result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iftrue,
result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iffalse,
result_pc_MUX_uxn_opcodes_h_l187_c7_580f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l188_c3_0737
BIN_OP_OR_uxn_opcodes_h_l188_c3_0737 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_left,
BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_right,
BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_left,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_right,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_left,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_right,
BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_return_output,
 tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
 result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output,
 tmp16_MUX_uxn_opcodes_h_l161_c7_c773_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_return_output,
 result_pc_MUX_uxn_opcodes_h_l161_c7_c773_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output,
 tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_return_output,
 result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_return_output,
 CONST_SR_8_uxn_opcodes_h_l169_c34_9596_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_f647_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_return_output,
 result_pc_MUX_uxn_opcodes_h_l171_c7_f647_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output,
 tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_return_output,
 result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output,
 tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output,
 result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output,
 CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output,
 tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output,
 result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_return_output,
 tmp16_MUX_uxn_opcodes_h_l187_c7_580f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_return_output,
 result_pc_MUX_uxn_opcodes_h_l187_c7_580f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l158_c3_8642 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_88af : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_6a8f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l155_c3_14b0_uxn_opcodes_h_l155_c3_14b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_c773_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_6626 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_3bcf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_f67b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_9596_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_9596_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_3771_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l182_c3_e878 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l185_c3_9323 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l191_c3_a294 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_return_output : unsigned(17 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_1f20_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_3a4e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_81e7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l167_l154_l184_DUPLICATE_1b0c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_f03f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d1d2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_491f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_95a0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l188_l180_DUPLICATE_fd8f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6cad_uxn_opcodes_h_l198_l150_DUPLICATE_6649_return_output : opcode_result_t;
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
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_88af := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l157_c3_88af;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_f67b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l168_c3_f67b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iffalse := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_6626 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l164_c3_6626;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_9596_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iffalse := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_491f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_491f_return_output := result.pc;

     -- BIN_OP_PLUS[uxn_opcodes_h_l185_c21_9c80] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_left;
     BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_return_output := BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l161_c7_c773] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_c773_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d1d2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d1d2_return_output := result.is_pc_updated;

     -- CONST_SR_8[uxn_opcodes_h_l169_c34_9596] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l169_c34_9596_x <= VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_9596_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_9596_return_output := CONST_SR_8_uxn_opcodes_h_l169_c34_9596_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l161_c11_85ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_6a8f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_81e7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_81e7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l167_l154_l184_DUPLICATE_1b0c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l167_l154_l184_DUPLICATE_1b0c_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l187_c11_6c60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_left;
     BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_return_output := BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_3a4e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_3a4e_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l188_l180_DUPLICATE_fd8f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l188_l180_DUPLICATE_fd8f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_4132] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l158_c11_b99e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l179_c11_9546] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_left;
     BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output := BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_95a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_95a0_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l154_c6_7772] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_left;
     BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output := BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l167_c11_12e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l182_c21_861e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l184_c11_5351] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_left;
     BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output := BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_f03f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_f03f_return_output := result.is_ram_read;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l165_c24_3bcf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_3bcf_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_1f20 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_1f20_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l176_c11_756c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_left;
     BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output := BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l154_c6_7772_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l161_c11_85ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l167_c11_12e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_4132_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l176_c11_756c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l179_c11_9546_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l184_c11_5351_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l187_c11_6c60_return_output;
     VAR_tmp16_uxn_opcodes_h_l158_c3_8642 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l158_c11_b99e_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l182_c3_e878 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l182_c21_861e_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l185_c3_9323 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l185_c21_9c80_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l188_l180_DUPLICATE_fd8f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l188_l180_DUPLICATE_fd8f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l165_c24_3bcf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_491f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_491f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_491f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_491f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_491f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_491f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_491f_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l171_l167_DUPLICATE_491f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l167_l154_l184_DUPLICATE_1b0c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l167_l154_l184_DUPLICATE_1b0c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l167_l154_l184_DUPLICATE_1b0c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l161_l167_l154_l184_DUPLICATE_1b0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_95a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_95a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_95a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_95a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_95a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_95a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l161_l187_l184_l179_l176_l171_l167_DUPLICATE_95a0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d1d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d1d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d1d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d1d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d1d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d1d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l161_l154_l184_l179_l176_l171_l167_DUPLICATE_d1d2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_f03f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_f03f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_f03f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_f03f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_f03f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_f03f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l161_l187_l154_l184_l179_l176_l167_DUPLICATE_f03f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_3a4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_3a4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l167_l154_l171_DUPLICATE_3a4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_81e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_81e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_1f20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l167_l154_DUPLICATE_1f20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l161_c7_c773_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l154_c2_6a8f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l182_c3_e878;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l185_c3_9323;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue := VAR_tmp16_uxn_opcodes_h_l158_c3_8642;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l169_c24_3771] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_3771_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l169_c34_9596_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l181_c3_f16d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_return_output := CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l154_c1_aaad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l187_c7_580f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l187_c7_580f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l184_c7_bbe3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_f647] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l188_c3_0737] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_left;
     BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_return_output := BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l167_c7_deb8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l161_c7_c773] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l187_c7_580f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_right := VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l188_c3_0737_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l169_c24_3771_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l181_c3_f16d_return_output;
     VAR_printf_uxn_opcodes_h_l155_c3_14b0_uxn_opcodes_h_l155_c3_14b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l154_c1_aaad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l187_c7_580f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l187_c7_580f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l187_c7_580f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l161_c7_c773_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_f647_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l161_c7_c773] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l184_c7_bbe3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l184_c7_bbe3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l167_c7_deb8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_return_output := result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l167_c7_deb8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;

     -- printf_uxn_opcodes_h_l155_c3_14b0[uxn_opcodes_h_l155_c3_14b0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l155_c3_14b0_uxn_opcodes_h_l155_c3_14b0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l155_c3_14b0_uxn_opcodes_h_l155_c3_14b0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_619d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l187_c7_580f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l187_c7_580f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_cond;
     tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_return_output := tmp16_MUX_uxn_opcodes_h_l187_c7_580f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l179_c7_c0a2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l184_c7_bbe3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_619d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l161_c7_c773_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l187_c7_580f_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l179_c7_c0a2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l161_c7_c773] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l161_c7_c773] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_cond;
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_return_output := result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l176_c7_28bb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l191_c15_9f07] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_left;
     BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_return_output := BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l184_c7_bbe3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_cond;
     tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output := tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l179_c7_c0a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l179_c7_c0a2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l191_c3_a294 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l191_c15_9f07_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l161_c7_c773_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l161_c7_c773_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iftrue := VAR_result_pc_uxn_opcodes_h_l191_c3_a294;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l176_c7_28bb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_f647] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_return_output := result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output := result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l176_c7_28bb] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l179_c7_c0a2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_cond;
     tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output := tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l176_c7_28bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l187_c7_580f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l187_c7_580f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_cond;
     result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_return_output := result_pc_MUX_uxn_opcodes_h_l187_c7_580f_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l187_c7_580f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_f647_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_f647] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_f647] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l167_c7_deb8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_f647] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l184_c7_bbe3] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_cond;
     result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iftrue;
     result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output := result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l176_c7_28bb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_cond;
     tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_return_output := tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_f647_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_f647_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_f647_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l184_c7_bbe3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l167_c7_deb8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l167_c7_deb8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l161_c7_c773] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_return_output := result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_f647] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_f647_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_f647_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l167_c7_deb8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l179_c7_c0a2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_cond;
     result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output := result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l179_c7_c0a2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l161_c7_c773_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_f647_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l167_c7_deb8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_cond;
     tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_return_output := tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l161_c7_c773] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l176_c7_28bb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_cond;
     result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_return_output := result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l161_c7_c773] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l161_c7_c773] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l161_c7_c773_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l161_c7_c773_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l161_c7_c773_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l176_c7_28bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l161_c7_c773] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l161_c7_c773_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_cond;
     tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iftrue;
     tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_return_output := tmp16_MUX_uxn_opcodes_h_l161_c7_c773_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l171_c7_f647] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l171_c7_f647_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_cond;
     result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iftrue;
     result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_return_output := result_pc_MUX_uxn_opcodes_h_l171_c7_f647_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_f647_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l161_c7_c773_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l167_c7_deb8] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_cond;
     result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iftrue;
     result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_return_output := result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_cond;
     tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output := tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l167_c7_deb8_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l161_c7_c773] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l161_c7_c773_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_cond;
     result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iftrue;
     result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_return_output := result_pc_MUX_uxn_opcodes_h_l161_c7_c773_return_output;

     -- Submodule level 11
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l161_c7_c773_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l154_c2_6a8f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_cond;
     result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output := result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6cad_uxn_opcodes_h_l198_l150_DUPLICATE_6649 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6cad_uxn_opcodes_h_l198_l150_DUPLICATE_6649_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6cad(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l154_c2_6a8f_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6cad_uxn_opcodes_h_l198_l150_DUPLICATE_6649_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6cad_uxn_opcodes_h_l198_l150_DUPLICATE_6649_return_output;
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
