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
-- Submodules: 71
entity jsi_0CLK_cf70ec0f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_cf70ec0f;
architecture arch of jsi_0CLK_cf70ec0f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l142_c6_316d]
signal BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l142_c1_33e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l142_c2_9e6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l142_c2_9e6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l142_c2_9e6c]
signal result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l142_c2_9e6c]
signal result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l142_c2_9e6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l142_c2_9e6c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l142_c2_9e6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l142_c2_9e6c]
signal result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l142_c2_9e6c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l142_c2_9e6c]
signal tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l143_c3_bd1e[uxn_opcodes_h_l143_c3_bd1e]
signal printf_uxn_opcodes_h_l143_c3_bd1e_uxn_opcodes_h_l143_c3_bd1e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l146_c11_d39a]
signal BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l149_c11_a2aa]
signal BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l149_c7_c8dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l149_c7_c8dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l149_c7_c8dc]
signal result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l149_c7_c8dc]
signal result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l149_c7_c8dc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l149_c7_c8dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l149_c7_c8dc]
signal result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l149_c7_c8dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l149_c7_c8dc]
signal tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l155_c11_6a5b]
signal BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l155_c7_b222]
signal result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l155_c7_b222]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l155_c7_b222]
signal result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l155_c7_b222]
signal result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l155_c7_b222]
signal result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l155_c7_b222]
signal result_pc_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l155_c7_b222]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l155_c7_b222]
signal tmp16_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l157_c34_75fc]
signal CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l160_c11_3778]
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_87db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_87db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l160_c7_87db]
signal result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_87db]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l160_c7_87db]
signal result_pc_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l160_c7_87db]
signal tmp16_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l164_c11_0646]
signal BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l164_c7_674a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l164_c7_674a]
signal result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l164_c7_674a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l164_c7_674a]
signal result_pc_MUX_uxn_opcodes_h_l164_c7_674a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l164_c7_674a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l164_c7_674a]
signal tmp16_MUX_uxn_opcodes_h_l164_c7_674a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l164_c7_674a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l166_c3_0bf4]
signal CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l167_c21_5649]
signal BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l169_c11_27e6]
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l169_c7_9ee6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l169_c7_9ee6]
signal result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l169_c7_9ee6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l169_c7_9ee6]
signal result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l169_c7_9ee6]
signal tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l170_c21_0985]
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l172_c11_8243]
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l172_c7_f997]
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l172_c7_f997]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l172_c7_f997]
signal result_pc_MUX_uxn_opcodes_h_l172_c7_f997_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l172_c7_f997_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l172_c7_f997]
signal tmp16_MUX_uxn_opcodes_h_l172_c7_f997_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l172_c7_f997_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l173_c3_929e]
signal BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l175_c15_c2cd]
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l175_c15_5d3e]
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l177_c11_432a]
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l177_c7_169a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l177_c7_169a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ac32( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.pc := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.stack_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d
BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_left,
BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_right,
BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c
result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c
result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c
result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_cond,
result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue,
result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse,
result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c
result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c
result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c
result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_cond,
result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c
tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_cond,
tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue,
tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse,
tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output);

-- printf_uxn_opcodes_h_l143_c3_bd1e_uxn_opcodes_h_l143_c3_bd1e
printf_uxn_opcodes_h_l143_c3_bd1e_uxn_opcodes_h_l143_c3_bd1e : entity work.printf_uxn_opcodes_h_l143_c3_bd1e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l143_c3_bd1e_uxn_opcodes_h_l143_c3_bd1e_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a
BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_left,
BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_right,
BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa
BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_left,
BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_right,
BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc
result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc
result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc
result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_cond,
result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue,
result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse,
result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc
result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc
result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc
result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_cond,
result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc
result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc
tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_cond,
tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b
BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_left,
BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_right,
BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222
result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222
result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222
result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_cond,
result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222
result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_cond,
result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_return_output);

-- result_pc_MUX_uxn_opcodes_h_l155_c7_b222
result_pc_MUX_uxn_opcodes_h_l155_c7_b222 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l155_c7_b222_cond,
result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iftrue,
result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iffalse,
result_pc_MUX_uxn_opcodes_h_l155_c7_b222_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222
result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_return_output);

-- tmp16_MUX_uxn_opcodes_h_l155_c7_b222
tmp16_MUX_uxn_opcodes_h_l155_c7_b222 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l155_c7_b222_cond,
tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iftrue,
tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iffalse,
tmp16_MUX_uxn_opcodes_h_l155_c7_b222_return_output);

-- CONST_SR_8_uxn_opcodes_h_l157_c34_75fc
CONST_SR_8_uxn_opcodes_h_l157_c34_75fc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_x,
CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778
BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_left,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_right,
BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db
result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_cond,
result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_return_output);

-- result_pc_MUX_uxn_opcodes_h_l160_c7_87db
result_pc_MUX_uxn_opcodes_h_l160_c7_87db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l160_c7_87db_cond,
result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iftrue,
result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iffalse,
result_pc_MUX_uxn_opcodes_h_l160_c7_87db_return_output);

-- tmp16_MUX_uxn_opcodes_h_l160_c7_87db
tmp16_MUX_uxn_opcodes_h_l160_c7_87db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l160_c7_87db_cond,
tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iftrue,
tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iffalse,
tmp16_MUX_uxn_opcodes_h_l160_c7_87db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646
BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_left,
BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_right,
BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a
result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l164_c7_674a
result_pc_MUX_uxn_opcodes_h_l164_c7_674a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l164_c7_674a_cond,
result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iftrue,
result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iffalse,
result_pc_MUX_uxn_opcodes_h_l164_c7_674a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l164_c7_674a
tmp16_MUX_uxn_opcodes_h_l164_c7_674a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l164_c7_674a_cond,
tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iftrue,
tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iffalse,
tmp16_MUX_uxn_opcodes_h_l164_c7_674a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4
CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_x,
CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649
BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_left,
BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_right,
BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6
BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_left,
BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_right,
BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6
result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6
result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_cond,
result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue,
result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse,
result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6
tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_cond,
tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue,
tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse,
tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985
BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_left,
BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_right,
BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243
BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_left,
BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_right,
BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_return_output);

-- result_pc_MUX_uxn_opcodes_h_l172_c7_f997
result_pc_MUX_uxn_opcodes_h_l172_c7_f997 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l172_c7_f997_cond,
result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iftrue,
result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iffalse,
result_pc_MUX_uxn_opcodes_h_l172_c7_f997_return_output);

-- tmp16_MUX_uxn_opcodes_h_l172_c7_f997
tmp16_MUX_uxn_opcodes_h_l172_c7_f997 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l172_c7_f997_cond,
tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iftrue,
tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iffalse,
tmp16_MUX_uxn_opcodes_h_l172_c7_f997_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l173_c3_929e
BIN_OP_OR_uxn_opcodes_h_l173_c3_929e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_left,
BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_right,
BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd
BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_left,
BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_right,
BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e
BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_left,
BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_right,
BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a
BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_left,
BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_right,
BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
 result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output,
 result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output,
 tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_return_output,
 result_pc_MUX_uxn_opcodes_h_l155_c7_b222_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_return_output,
 tmp16_MUX_uxn_opcodes_h_l155_c7_b222_return_output,
 CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_return_output,
 result_pc_MUX_uxn_opcodes_h_l160_c7_87db_return_output,
 tmp16_MUX_uxn_opcodes_h_l160_c7_87db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_return_output,
 result_pc_MUX_uxn_opcodes_h_l164_c7_674a_return_output,
 tmp16_MUX_uxn_opcodes_h_l164_c7_674a_return_output,
 CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output,
 result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output,
 tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_return_output,
 result_pc_MUX_uxn_opcodes_h_l172_c7_f997_return_output,
 tmp16_MUX_uxn_opcodes_h_l172_c7_f997_return_output,
 BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l145_c3_a101 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l142_c2_9e6c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l146_c3_10db : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l143_c3_bd1e_uxn_opcodes_h_l143_c3_bd1e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l152_c3_1e37 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l149_c7_c8dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l153_c24_a3b1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l156_c3_4673 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l157_c24_f140_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l167_c3_d575 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l170_c3_eb7a : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l175_c3_c306 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l155_l142_l160_DUPLICATE_72a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l155_l142_DUPLICATE_bec8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l169_l142_l149_DUPLICATE_298e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l142_l172_l169_l164_l160_l155_l149_DUPLICATE_4925_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l155_l142_DUPLICATE_bc55_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l142_l169_l164_l160_l155_l149_l177_DUPLICATE_9775_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l172_l169_l164_l160_l155_l149_l177_DUPLICATE_9c02_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l165_DUPLICATE_7ef9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l182_l138_DUPLICATE_7334_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l145_c3_a101 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l145_c3_a101;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l156_c3_4673 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l156_c3_4673;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l152_c3_1e37 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l152_c3_1e37;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l142_c6_316d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_left;
     BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output := BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l153_c24_a3b1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l153_c24_a3b1_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l169_l142_l149_DUPLICATE_298e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l169_l142_l149_DUPLICATE_298e_return_output := result.ram_addr;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l142_c2_9e6c] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l142_c2_9e6c_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l167_c21_5649] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_left;
     BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_return_output := BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l155_l142_DUPLICATE_bc55 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l155_l142_DUPLICATE_bc55_return_output := result.stack_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l146_c11_d39a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l149_c11_a2aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l169_c11_27e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l172_l169_l164_l160_l155_l149_l177_DUPLICATE_9c02 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l172_l169_l164_l160_l155_l149_l177_DUPLICATE_9c02_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l165_DUPLICATE_7ef9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l165_DUPLICATE_7ef9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l164_c11_0646] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_left;
     BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_return_output := BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l157_c34_75fc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_return_output := CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l142_l172_l169_l164_l160_l155_l149_DUPLICATE_4925 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l142_l172_l169_l164_l160_l155_l149_DUPLICATE_4925_return_output := result.pc;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l155_l142_DUPLICATE_bec8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l155_l142_DUPLICATE_bec8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l160_c11_3778] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_left;
     BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output := BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l155_l142_l160_DUPLICATE_72a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l155_l142_l160_DUPLICATE_72a8_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l142_l169_l164_l160_l155_l149_l177_DUPLICATE_9775 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l142_l169_l164_l160_l155_l149_l177_DUPLICATE_9775_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l172_c11_8243] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_left;
     BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_return_output := BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l149_c7_c8dc] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l149_c7_c8dc_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l170_c21_0985] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_left;
     BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_return_output := BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l177_c11_432a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_left;
     BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_return_output := BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l155_c11_6a5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l142_c6_316d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l149_c11_a2aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l155_c11_6a5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l160_c11_3778_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l164_c11_0646_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l169_c11_27e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l172_c11_8243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l177_c11_432a_return_output;
     VAR_tmp16_uxn_opcodes_h_l146_c3_10db := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l146_c11_d39a_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l167_c3_d575 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l167_c21_5649_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l170_c3_eb7a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l170_c21_0985_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l165_DUPLICATE_7ef9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l173_l165_DUPLICATE_7ef9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l153_c24_a3b1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l142_l172_l169_l164_l160_l155_l149_DUPLICATE_4925_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l142_l172_l169_l164_l160_l155_l149_DUPLICATE_4925_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l142_l172_l169_l164_l160_l155_l149_DUPLICATE_4925_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l142_l172_l169_l164_l160_l155_l149_DUPLICATE_4925_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l142_l172_l169_l164_l160_l155_l149_DUPLICATE_4925_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l142_l172_l169_l164_l160_l155_l149_DUPLICATE_4925_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l142_l172_l169_l164_l160_l155_l149_DUPLICATE_4925_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l169_l142_l149_DUPLICATE_298e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l169_l142_l149_DUPLICATE_298e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l169_l142_l149_DUPLICATE_298e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l172_l169_l164_l160_l155_l149_l177_DUPLICATE_9c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l172_l169_l164_l160_l155_l149_l177_DUPLICATE_9c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l172_l169_l164_l160_l155_l149_l177_DUPLICATE_9c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l172_l169_l164_l160_l155_l149_l177_DUPLICATE_9c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l172_l169_l164_l160_l155_l149_l177_DUPLICATE_9c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l172_l169_l164_l160_l155_l149_l177_DUPLICATE_9c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l172_l169_l164_l160_l155_l149_l177_DUPLICATE_9c02_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l142_l169_l164_l160_l155_l149_l177_DUPLICATE_9775_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l142_l169_l164_l160_l155_l149_l177_DUPLICATE_9775_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l142_l169_l164_l160_l155_l149_l177_DUPLICATE_9775_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l142_l169_l164_l160_l155_l149_l177_DUPLICATE_9775_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l142_l169_l164_l160_l155_l149_l177_DUPLICATE_9775_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l142_l169_l164_l160_l155_l149_l177_DUPLICATE_9775_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l142_l169_l164_l160_l155_l149_l177_DUPLICATE_9775_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l155_l142_l160_DUPLICATE_72a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l155_l142_l160_DUPLICATE_72a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l155_l142_l160_DUPLICATE_72a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l155_l142_DUPLICATE_bec8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l155_l142_DUPLICATE_bec8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l155_l142_DUPLICATE_bc55_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l155_l142_DUPLICATE_bc55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l149_c7_c8dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l142_c2_9e6c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l167_c3_d575;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l170_c3_eb7a;
     VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue := VAR_tmp16_uxn_opcodes_h_l146_c3_10db;
     -- BIN_OP_OR[uxn_opcodes_h_l173_c3_929e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_left;
     BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_return_output := BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l177_c7_169a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l160_c7_87db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l155_c7_b222] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l149_c7_c8dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l142_c2_9e6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l177_c7_169a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l166_c3_0bf4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_return_output := CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l169_c7_9ee6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l142_c1_33e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l157_c24_f140] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l157_c24_f140_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l157_c34_75fc_return_output);

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_right := VAR_BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l173_c3_929e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l157_c24_f140_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l166_c3_0bf4_return_output;
     VAR_printf_uxn_opcodes_h_l143_c3_bd1e_uxn_opcodes_h_l143_c3_bd1e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l142_c1_33e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l177_c7_169a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l177_c7_169a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l160_c7_87db_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l155_c7_b222_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l172_c7_f997] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l172_c7_f997] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l142_c2_9e6c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l149_c7_c8dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l155_c7_b222] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_cond;
     result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_return_output := result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l172_c7_f997] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l172_c7_f997_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_cond;
     tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iftrue;
     tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_return_output := tmp16_MUX_uxn_opcodes_h_l172_c7_f997_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l175_c15_c2cd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l164_c7_674a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l155_c7_b222] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_return_output;

     -- printf_uxn_opcodes_h_l143_c3_bd1e[uxn_opcodes_h_l143_c3_bd1e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l143_c3_bd1e_uxn_opcodes_h_l143_c3_bd1e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l143_c3_bd1e_uxn_opcodes_h_l143_c3_bd1e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_c2cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l172_c7_f997_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l172_c7_f997_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l155_c7_b222_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l164_c7_674a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l155_c7_b222_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l172_c7_f997_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l142_c2_9e6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l149_c7_c8dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l169_c7_9ee6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l160_c7_87db] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_return_output := result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l169_c7_9ee6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l175_c15_5d3e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l149_c7_c8dc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output := result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l169_c7_9ee6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_cond;
     tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output := tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l175_c3_c306 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l175_c15_5d3e_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l160_c7_87db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iftrue := VAR_result_pc_uxn_opcodes_h_l175_c3_c306;
     -- tmp16_MUX[uxn_opcodes_h_l164_c7_674a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l164_c7_674a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_cond;
     tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_return_output := tmp16_MUX_uxn_opcodes_h_l164_c7_674a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l172_c7_f997] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l172_c7_f997_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_cond;
     result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iftrue;
     result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_return_output := result_pc_MUX_uxn_opcodes_h_l172_c7_f997_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l164_c7_674a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l142_c2_9e6c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output := result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l155_c7_b222] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_return_output := result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l142_c2_9e6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l164_c7_674a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l164_c7_674a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l164_c7_674a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l172_c7_f997_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l155_c7_b222_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l164_c7_674a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l160_c7_87db] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l160_c7_87db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l149_c7_c8dc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l160_c7_87db] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l160_c7_87db_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_cond;
     tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iftrue;
     tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_return_output := tmp16_MUX_uxn_opcodes_h_l160_c7_87db_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l169_c7_9ee6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_cond;
     result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output := result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l160_c7_87db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l160_c7_87db_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l169_c7_9ee6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l160_c7_87db_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l164_c7_674a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l164_c7_674a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_cond;
     result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_return_output := result_pc_MUX_uxn_opcodes_h_l164_c7_674a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l155_c7_b222] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l155_c7_b222] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l155_c7_b222] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l155_c7_b222_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_cond;
     tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iftrue;
     tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_return_output := tmp16_MUX_uxn_opcodes_h_l155_c7_b222_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l142_c2_9e6c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l155_c7_b222_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l155_c7_b222_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l164_c7_674a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l155_c7_b222_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l160_c7_87db] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l160_c7_87db_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_cond;
     result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iftrue;
     result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_return_output := result_pc_MUX_uxn_opcodes_h_l160_c7_87db_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l149_c7_c8dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_cond;
     tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output := tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l149_c7_c8dc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l149_c7_c8dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l160_c7_87db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l155_c7_b222] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l155_c7_b222_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_cond;
     result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iftrue;
     result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_return_output := result_pc_MUX_uxn_opcodes_h_l155_c7_b222_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l142_c2_9e6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l142_c2_9e6c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l142_c2_9e6c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_cond;
     tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output := tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l155_c7_b222_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l149_c7_c8dc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_cond;
     result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output := result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l149_c7_c8dc_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l142_c2_9e6c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_cond;
     result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output := result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l182_l138_DUPLICATE_7334 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l182_l138_DUPLICATE_7334_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ac32(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l142_c2_9e6c_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l182_l138_DUPLICATE_7334_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l182_l138_DUPLICATE_7334_return_output;
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
