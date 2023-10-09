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
entity jsi_0CLK_8f02dccf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsi_0CLK_8f02dccf;
architecture arch of jsi_0CLK_8f02dccf is
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
-- BIN_OP_EQ[uxn_opcodes_h_l152_c6_a09a]
signal BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l152_c1_91ee]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l152_c2_4963]
signal result_pc_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l152_c2_4963]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l152_c2_4963]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l152_c2_4963]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l152_c2_4963]
signal result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l152_c2_4963]
signal result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l152_c2_4963]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l152_c2_4963]
signal result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l152_c2_4963]
signal result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l152_c2_4963]
signal result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l152_c2_4963]
signal tmp16_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l153_c3_1f28[uxn_opcodes_h_l153_c3_1f28]
signal printf_uxn_opcodes_h_l153_c3_1f28_uxn_opcodes_h_l153_c3_1f28_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l156_c11_2db8]
signal BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l159_c11_9a14]
signal BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l159_c7_6044]
signal result_pc_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l159_c7_6044]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l159_c7_6044]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l159_c7_6044]
signal result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l159_c7_6044]
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l159_c7_6044]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l159_c7_6044]
signal result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l159_c7_6044]
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l159_c7_6044]
signal result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l159_c7_6044]
signal tmp16_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l165_c11_c2e2]
signal BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l165_c7_b1ba]
signal result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l165_c7_b1ba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l165_c7_b1ba]
signal result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l165_c7_b1ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l165_c7_b1ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l165_c7_b1ba]
signal result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l165_c7_b1ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l165_c7_b1ba]
signal result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l165_c7_b1ba]
signal tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l167_c34_949d]
signal CONST_SR_8_uxn_opcodes_h_l167_c34_949d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l167_c34_949d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l171_c11_2b1a]
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_4f9d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l171_c7_4f9d]
signal result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_4f9d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_4f9d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_4f9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_4f9d]
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l171_c7_4f9d]
signal tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l175_c11_f0b1]
signal BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l175_c7_33cc]
signal result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l175_c7_33cc]
signal result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l175_c7_33cc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l175_c7_33cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l175_c7_33cc]
signal result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l175_c7_33cc]
signal tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l177_c3_bc59]
signal CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l178_c21_53ba]
signal BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l180_c11_ee2c]
signal BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l180_c7_a15e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l180_c7_a15e]
signal result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l180_c7_a15e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l180_c7_a15e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l180_c7_a15e]
signal result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l180_c7_a15e]
signal tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l181_c21_ab01]
signal BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l183_c11_192b]
signal BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l183_c7_bb11]
signal result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l183_c7_bb11]
signal result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l183_c7_bb11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l183_c7_bb11]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l183_c7_bb11]
signal tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l184_c3_2cf2]
signal BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l187_c15_1aad]
signal BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l187_c15_5322]
signal BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_return_output : unsigned(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l189_c11_d406]
signal BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l189_c7_6086]
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l189_c7_6086]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_cb37( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.pc := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_ram_read := ref_toks_8;
      base.is_stack_write := ref_toks_9;
      base.ram_addr := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a
BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_left,
BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_right,
BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_return_output);

-- result_pc_MUX_uxn_opcodes_h_l152_c2_4963
result_pc_MUX_uxn_opcodes_h_l152_c2_4963 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l152_c2_4963_cond,
result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iftrue,
result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iffalse,
result_pc_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963
result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963
result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963
result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963
result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_cond,
result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963
result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963
result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963
result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963
result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_cond,
result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

-- tmp16_MUX_uxn_opcodes_h_l152_c2_4963
tmp16_MUX_uxn_opcodes_h_l152_c2_4963 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l152_c2_4963_cond,
tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iftrue,
tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iffalse,
tmp16_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

-- printf_uxn_opcodes_h_l153_c3_1f28_uxn_opcodes_h_l153_c3_1f28
printf_uxn_opcodes_h_l153_c3_1f28_uxn_opcodes_h_l153_c3_1f28 : entity work.printf_uxn_opcodes_h_l153_c3_1f28_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l153_c3_1f28_uxn_opcodes_h_l153_c3_1f28_CLOCK_ENABLE);

-- BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8
BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_left,
BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_right,
BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14
BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_left,
BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_right,
BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output);

-- result_pc_MUX_uxn_opcodes_h_l159_c7_6044
result_pc_MUX_uxn_opcodes_h_l159_c7_6044 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l159_c7_6044_cond,
result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iftrue,
result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iffalse,
result_pc_MUX_uxn_opcodes_h_l159_c7_6044_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044
result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044
result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_cond,
result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044
result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044
result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_cond,
result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_return_output);

-- tmp16_MUX_uxn_opcodes_h_l159_c7_6044
tmp16_MUX_uxn_opcodes_h_l159_c7_6044 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l159_c7_6044_cond,
tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iftrue,
tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iffalse,
tmp16_MUX_uxn_opcodes_h_l159_c7_6044_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2
BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_left,
BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_right,
BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba
result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_cond,
result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue,
result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse,
result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba
result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_cond,
result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba
result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba
result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_cond,
result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output);

-- tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba
tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_cond,
tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue,
tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse,
tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output);

-- CONST_SR_8_uxn_opcodes_h_l167_c34_949d
CONST_SR_8_uxn_opcodes_h_l167_c34_949d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l167_c34_949d_x,
CONST_SR_8_uxn_opcodes_h_l167_c34_949d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a
BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_left,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_right,
BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d
result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_cond,
result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue,
result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse,
result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d
tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_cond,
tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue,
tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse,
tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1
BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_left,
BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_right,
BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc
result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l175_c7_33cc
result_pc_MUX_uxn_opcodes_h_l175_c7_33cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_cond,
result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue,
result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse,
result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc
result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc
result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc
result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l175_c7_33cc
tmp16_MUX_uxn_opcodes_h_l175_c7_33cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_cond,
tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_return_output);

-- CONST_SL_8_uxn_opcodes_h_l177_c3_bc59
CONST_SL_8_uxn_opcodes_h_l177_c3_bc59 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_x,
CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba
BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_left,
BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_right,
BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c
BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_left,
BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_right,
BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e
result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l180_c7_a15e
result_pc_MUX_uxn_opcodes_h_l180_c7_a15e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_cond,
result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue,
result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse,
result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e
result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e
result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e
result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l180_c7_a15e
tmp16_MUX_uxn_opcodes_h_l180_c7_a15e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_cond,
tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue,
tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse,
tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01
BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_left,
BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_right,
BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b
BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_left,
BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_right,
BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11
result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_return_output);

-- result_pc_MUX_uxn_opcodes_h_l183_c7_bb11
result_pc_MUX_uxn_opcodes_h_l183_c7_bb11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_cond,
result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue,
result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse,
result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11
result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_return_output);

-- tmp16_MUX_uxn_opcodes_h_l183_c7_bb11
tmp16_MUX_uxn_opcodes_h_l183_c7_bb11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_cond,
tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue,
tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse,
tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2
BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_left,
BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_right,
BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad
BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_left,
BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_right,
BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322
BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_left,
BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_right,
BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406
BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_left,
BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_right,
BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086
result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_return_output,
 result_pc_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
 tmp16_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output,
 result_pc_MUX_uxn_opcodes_h_l159_c7_6044_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_return_output,
 tmp16_MUX_uxn_opcodes_h_l159_c7_6044_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output,
 result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output,
 tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output,
 CONST_SR_8_uxn_opcodes_h_l167_c34_949d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output,
 result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output,
 tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_return_output,
 result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_return_output,
 tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_return_output,
 CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_return_output,
 result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_return_output,
 tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_return_output,
 result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_return_output,
 tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_return_output,
 BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l155_c3_ccb7 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l152_c2_4963_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l156_c3_e258 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l153_c3_1f28_uxn_opcodes_h_l153_c3_1f28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l159_c7_6044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_de4a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c24_254e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l166_c3_06ef : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l167_c34_949d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l167_c34_949d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l167_c24_8a1a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l178_c3_92aa : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l181_c3_8467 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l187_c3_455f : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_return_output : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l165_l183_DUPLICATE_ddd0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l189_l175_l152_l180_l159_l165_DUPLICATE_3562_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l152_l165_DUPLICATE_1ece_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l152_l165_DUPLICATE_eaf2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l183_DUPLICATE_a89f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l171_l152_l165_DUPLICATE_0744_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l159_l152_l180_DUPLICATE_61a2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l189_l175_l180_l159_l165_l183_DUPLICATE_6d75_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l184_l176_DUPLICATE_7154_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l194_l148_DUPLICATE_cf74_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_right := to_unsigned(2, 2);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_right := to_unsigned(7, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l155_c3_ccb7 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l155_c3_ccb7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l166_c3_06ef := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l166_c3_06ef;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_de4a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l162_c3_de4a;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l167_c34_949d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l175_c11_f0b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l180_c11_ee2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l159_c11_9a14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_left;
     BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output := BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l152_c6_a09a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_left;
     BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output := BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l178_c21_53ba] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_left;
     BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_return_output := BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l165_l183_DUPLICATE_ddd0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l165_l183_DUPLICATE_ddd0_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l183_c11_192b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_left;
     BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_return_output := BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l159_c7_6044] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l159_c7_6044_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l152_l165_DUPLICATE_eaf2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l152_l165_DUPLICATE_eaf2_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l159_l152_l180_DUPLICATE_61a2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l159_l152_l180_DUPLICATE_61a2_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l171_l152_l165_DUPLICATE_0744 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l171_l152_l165_DUPLICATE_0744_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l189_l175_l180_l159_l165_l183_DUPLICATE_6d75 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l189_l175_l180_l159_l165_l183_DUPLICATE_6d75_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l167_c34_949d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l167_c34_949d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l167_c34_949d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l167_c34_949d_return_output := CONST_SR_8_uxn_opcodes_h_l167_c34_949d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l184_l176_DUPLICATE_7154 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l184_l176_DUPLICATE_7154_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l163_c24_254e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c24_254e_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l152_l165_DUPLICATE_1ece LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l152_l165_DUPLICATE_1ece_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l165_c11_c2e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l181_c21_ab01] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_left;
     BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_return_output := BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l152_c2_4963_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l183_DUPLICATE_a89f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l183_DUPLICATE_a89f_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l171_c11_2b1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_left;
     BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output := BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l156_c11_2db8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l189_l175_l152_l180_l159_l165_DUPLICATE_3562 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l189_l175_l152_l180_l159_l165_DUPLICATE_3562_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l189_c11_d406] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_left;
     BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_return_output := BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l152_c6_a09a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l159_c11_9a14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l165_c11_c2e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l171_c11_2b1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l175_c11_f0b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l180_c11_ee2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l183_c11_192b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c11_d406_return_output;
     VAR_tmp16_uxn_opcodes_h_l156_c3_e258 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l156_c11_2db8_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l178_c3_92aa := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l178_c21_53ba_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l181_c3_8467 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l181_c21_ab01_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l184_l176_DUPLICATE_7154_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l184_l176_DUPLICATE_7154_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l163_c24_254e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l165_l183_DUPLICATE_ddd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l165_l183_DUPLICATE_ddd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l165_l183_DUPLICATE_ddd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l165_l183_DUPLICATE_ddd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l165_l183_DUPLICATE_ddd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l165_l183_DUPLICATE_ddd0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l165_l183_DUPLICATE_ddd0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l159_l152_l180_DUPLICATE_61a2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l159_l152_l180_DUPLICATE_61a2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l159_l152_l180_DUPLICATE_61a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l189_l175_l180_l159_l165_l183_DUPLICATE_6d75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l189_l175_l180_l159_l165_l183_DUPLICATE_6d75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l189_l175_l180_l159_l165_l183_DUPLICATE_6d75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l189_l175_l180_l159_l165_l183_DUPLICATE_6d75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l189_l175_l180_l159_l165_l183_DUPLICATE_6d75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l189_l175_l180_l159_l165_l183_DUPLICATE_6d75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l171_l189_l175_l180_l159_l165_l183_DUPLICATE_6d75_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l189_l175_l152_l180_l159_l165_DUPLICATE_3562_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l189_l175_l152_l180_l159_l165_DUPLICATE_3562_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l189_l175_l152_l180_l159_l165_DUPLICATE_3562_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l189_l175_l152_l180_l159_l165_DUPLICATE_3562_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l189_l175_l152_l180_l159_l165_DUPLICATE_3562_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l189_l175_l152_l180_l159_l165_DUPLICATE_3562_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l171_l189_l175_l152_l180_l159_l165_DUPLICATE_3562_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l183_DUPLICATE_a89f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l183_DUPLICATE_a89f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l183_DUPLICATE_a89f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l183_DUPLICATE_a89f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l183_DUPLICATE_a89f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l171_l175_l152_l180_l159_l183_DUPLICATE_a89f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l171_l152_l165_DUPLICATE_0744_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l171_l152_l165_DUPLICATE_0744_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l171_l152_l165_DUPLICATE_0744_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l152_l165_DUPLICATE_eaf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l152_l165_DUPLICATE_eaf2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l152_l165_DUPLICATE_1ece_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l152_l165_DUPLICATE_1ece_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l159_c7_6044_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l152_c2_4963_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l178_c3_92aa;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l181_c3_8467;
     VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iftrue := VAR_tmp16_uxn_opcodes_h_l156_c3_e258;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l183_c7_bb11] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l167_c24_8a1a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l167_c24_8a1a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l167_c34_949d_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l177_c3_bc59] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_x <= VAR_CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_return_output := CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l165_c7_b1ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l189_c7_6086] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l159_c7_6044] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l189_c7_6086] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l152_c1_91ee] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l184_c3_2cf2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_left;
     BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_return_output := BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l171_c7_4f9d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l180_c7_a15e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_right := VAR_BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l184_c3_2cf2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l167_c24_8a1a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l177_c3_bc59_return_output;
     VAR_printf_uxn_opcodes_h_l153_c3_1f28_uxn_opcodes_h_l153_c3_1f28_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l152_c1_91ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c7_6086_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c7_6086_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l183_c7_bb11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l159_c7_6044_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l180_c7_a15e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l165_c7_b1ba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output := result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l183_c7_bb11] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_cond;
     tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue;
     tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_return_output := tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_return_output;

     -- printf_uxn_opcodes_h_l153_c3_1f28[uxn_opcodes_h_l153_c3_1f28] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l153_c3_1f28_uxn_opcodes_h_l153_c3_1f28_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l153_c3_1f28_uxn_opcodes_h_l153_c3_1f28_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l183_c7_bb11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l183_c7_bb11] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l175_c7_33cc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l159_c7_6044] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l187_c15_1aad] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_left;
     BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_return_output := BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l165_c7_b1ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_1aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l183_c7_bb11_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l183_c7_bb11_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l159_c7_6044_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l183_c7_bb11_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l180_c7_a15e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l159_c7_6044] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_cond;
     result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_return_output := result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l187_c15_5322] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_left;
     BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_return_output := BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l171_c7_4f9d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l175_c7_33cc] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l159_c7_6044] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l180_c7_a15e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l180_c7_a15e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_cond;
     tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_return_output := tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;

     -- Submodule level 4
     VAR_result_pc_uxn_opcodes_h_l187_c3_455f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l187_c15_5322_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l159_c7_6044_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l159_c7_6044_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue := VAR_result_pc_uxn_opcodes_h_l187_c3_455f;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l171_c7_4f9d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l183_c7_bb11] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_cond;
     result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iftrue;
     result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_return_output := result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l175_c7_33cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_cond;
     tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_return_output := tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l175_c7_33cc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l175_c7_33cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l165_c7_b1ba] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output := result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_cond;
     result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_return_output := result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l183_c7_bb11_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l171_c7_4f9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l171_c7_4f9d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l180_c7_a15e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_cond;
     result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_return_output := result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l165_c7_b1ba] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l159_c7_6044] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_return_output := result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l171_c7_4f9d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_cond;
     tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output := tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l180_c7_a15e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l159_c7_6044_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l165_c7_b1ba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l159_c7_6044] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l165_c7_b1ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l165_c7_b1ba] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_cond;
     tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue;
     tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output := tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_return_output := result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l175_c7_33cc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_cond;
     result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_return_output := result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l159_c7_6044_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l175_c7_33cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l159_c7_6044] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l171_c7_4f9d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_cond;
     result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output := result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l159_c7_6044] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l159_c7_6044_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_cond;
     tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iftrue;
     tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_return_output := tmp16_MUX_uxn_opcodes_h_l159_c7_6044_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l159_c7_6044] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l159_c7_6044_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l159_c7_6044_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l171_c7_4f9d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l159_c7_6044_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l152_c2_4963_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_cond;
     tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iftrue;
     tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_return_output := tmp16_MUX_uxn_opcodes_h_l152_c2_4963_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l165_c7_b1ba] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_cond;
     result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iftrue;
     result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output := result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_return_output;

     -- Submodule level 9
     VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l165_c7_b1ba_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l152_c2_4963_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l159_c7_6044] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l159_c7_6044_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_cond;
     result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iftrue;
     result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_return_output := result_pc_MUX_uxn_opcodes_h_l159_c7_6044_return_output;

     -- Submodule level 10
     VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l159_c7_6044_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l152_c2_4963] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l152_c2_4963_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_cond;
     result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iftrue;
     result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_return_output := result_pc_MUX_uxn_opcodes_h_l152_c2_4963_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l194_l148_DUPLICATE_cf74 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l194_l148_DUPLICATE_cf74_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cb37(
     result,
     VAR_result_pc_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l152_c2_4963_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l152_c2_4963_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l194_l148_DUPLICATE_cf74_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cb37_uxn_opcodes_h_l194_l148_DUPLICATE_cf74_return_output;
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
