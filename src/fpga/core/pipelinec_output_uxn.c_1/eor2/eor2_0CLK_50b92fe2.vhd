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
entity eor2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_50b92fe2;
architecture arch of eor2_0CLK_50b92fe2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_98bd]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_bf3c]
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_d6ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1124_c7_6a49]
signal t16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1124_c7_6a49]
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1124_c7_6a49]
signal n16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_6a49]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_6a49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_6a49]
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_6a49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_6a49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_86de]
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1127_c7_ec73]
signal t16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1127_c7_ec73]
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1127_c7_ec73]
signal n16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_ec73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_ec73]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_ec73]
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_ec73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_ec73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_ce6e]
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1132_c7_705e]
signal t16_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1132_c7_705e]
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1132_c7_705e]
signal n16_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_705e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_705e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_705e]
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_705e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_705e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1133_c3_8714]
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_19fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1136_c7_fc3a]
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1136_c7_fc3a]
signal n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_fc3a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_fc3a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_fc3a]
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_fc3a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_fc3a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_b4ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1140_c7_8d20]
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1140_c7_8d20]
signal n16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_8d20]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_8d20]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_8d20]
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_8d20]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_8d20]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1141_c3_f043]
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_e13b]
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1143_c30_0362]
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_98b2]
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_f6e3]
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_f6e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_f6e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_f6e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1151_c31_cfe1]
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8b52( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output);

-- t16_MUX_uxn_opcodes_h_l1111_c2_bf3c
t16_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c
tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- n16_MUX_uxn_opcodes_h_l1111_c2_bf3c
n16_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output);

-- t16_MUX_uxn_opcodes_h_l1124_c7_6a49
t16_MUX_uxn_opcodes_h_l1124_c7_6a49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond,
t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue,
t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse,
t16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49
tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond,
tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue,
tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse,
tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output);

-- n16_MUX_uxn_opcodes_h_l1124_c7_6a49
n16_MUX_uxn_opcodes_h_l1124_c7_6a49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond,
n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue,
n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse,
n16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_cond,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_left,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_right,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output);

-- t16_MUX_uxn_opcodes_h_l1127_c7_ec73
t16_MUX_uxn_opcodes_h_l1127_c7_ec73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond,
t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue,
t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse,
t16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73
tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond,
tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue,
tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse,
tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output);

-- n16_MUX_uxn_opcodes_h_l1127_c7_ec73
n16_MUX_uxn_opcodes_h_l1127_c7_ec73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond,
n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue,
n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse,
n16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_cond,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_left,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_right,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output);

-- t16_MUX_uxn_opcodes_h_l1132_c7_705e
t16_MUX_uxn_opcodes_h_l1132_c7_705e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1132_c7_705e_cond,
t16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue,
t16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse,
t16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1132_c7_705e
tmp16_MUX_uxn_opcodes_h_l1132_c7_705e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_cond,
tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output);

-- n16_MUX_uxn_opcodes_h_l1132_c7_705e
n16_MUX_uxn_opcodes_h_l1132_c7_705e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1132_c7_705e_cond,
n16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue,
n16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse,
n16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714
BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_left,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_right,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a
tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond,
tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output);

-- n16_MUX_uxn_opcodes_h_l1136_c7_fc3a
n16_MUX_uxn_opcodes_h_l1136_c7_fc3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond,
n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue,
n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse,
n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20
tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond,
tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue,
tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse,
tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output);

-- n16_MUX_uxn_opcodes_h_l1140_c7_8d20
n16_MUX_uxn_opcodes_h_l1140_c7_8d20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond,
n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue,
n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse,
n16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_cond,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043
BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_left,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_right,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_left,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_right,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1143_c30_0362
sp_relative_shift_uxn_opcodes_h_l1143_c30_0362 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_ins,
sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_x,
sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_y,
sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_left,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_right,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1
CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_x,
CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output,
 t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output,
 t16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output,
 tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output,
 n16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output,
 t16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output,
 tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output,
 n16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output,
 t16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output,
 n16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output,
 tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output,
 n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output,
 tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output,
 n16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output,
 CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_00a1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_b50b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_c836 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_ee99 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_32f1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_6c85 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_0d69_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_c24c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_9654 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_c67f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1111_l1148_DUPLICATE_5e81_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1148_DUPLICATE_f0c2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_10c2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_l1148_DUPLICATE_b385_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1137_l1141_DUPLICATE_3383_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_bda4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1155_l1107_DUPLICATE_b8ea_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_00a1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_00a1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_32f1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_32f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_9654 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_9654;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_c24c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_c24c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_6c85 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_6c85;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_b50b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_b50b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_ee99 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_ee99;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_c836 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_c836;
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_10c2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_10c2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_ce6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1148_DUPLICATE_f0c2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1148_DUPLICATE_f0c2_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1137_l1141_DUPLICATE_3383 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1137_l1141_DUPLICATE_3383_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_bda4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_bda4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_98b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_b4ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_86de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1143_c30_0362] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_ins;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_x;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_return_output := sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_d6ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1111_l1148_DUPLICATE_5e81 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1111_l1148_DUPLICATE_5e81_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l1151_c31_cfe1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_return_output := CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_98bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_19fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_l1148_DUPLICATE_b385 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_l1148_DUPLICATE_b385_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_98bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d6ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_86de_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_ce6e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_19fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_b4ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_98b2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1137_l1141_DUPLICATE_3383_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1137_l1141_DUPLICATE_3383_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1137_l1141_DUPLICATE_3383_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1148_DUPLICATE_f0c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1148_DUPLICATE_f0c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1148_DUPLICATE_f0c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1148_DUPLICATE_f0c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1148_DUPLICATE_f0c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_l1148_DUPLICATE_b385_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_l1148_DUPLICATE_b385_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_l1148_DUPLICATE_b385_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_l1148_DUPLICATE_b385_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_l1148_DUPLICATE_b385_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_l1148_DUPLICATE_b385_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_10c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_10c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_10c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_10c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_10c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_bda4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_bda4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1111_l1148_DUPLICATE_5e81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1111_l1148_DUPLICATE_5e81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1111_l1148_DUPLICATE_5e81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1111_l1148_DUPLICATE_5e81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1111_l1148_DUPLICATE_5e81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1136_l1132_l1127_l1124_l1111_l1148_DUPLICATE_5e81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_bf3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_0362_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1133_c3_8714] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_left;
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_return_output := BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1141_c3_f043] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_left;
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_return_output := BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_f6e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_f6e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_8d20] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_f6e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1151_c21_c67f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_c67f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_cfe1_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_8714_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f043_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_c67f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_fdab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_f6e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_e13b] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_left;
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_return_output := BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_8d20] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_8d20] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_8d20] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_fc3a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1132_c7_705e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1132_c7_705e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_cond;
     t16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue;
     t16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output := t16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1140_c7_8d20] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond;
     n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue;
     n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output := n16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_f6e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_fc3a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_fc3a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1146_c21_0d69] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_0d69_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_e13b_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_fc3a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1140_c7_8d20] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_cond;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output := tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;

     -- t16_MUX[uxn_opcodes_h_l1127_c7_ec73] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond;
     t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue;
     t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output := t16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;

     -- n16_MUX[uxn_opcodes_h_l1136_c7_fc3a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond;
     n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue;
     n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output := n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_705e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_0d69_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_ec73] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1136_c7_fc3a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output := tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_705e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_8d20] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output := result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;

     -- t16_MUX[uxn_opcodes_h_l1124_c7_6a49] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond;
     t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue;
     t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output := t16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;

     -- n16_MUX[uxn_opcodes_h_l1132_c7_705e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1132_c7_705e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_cond;
     n16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue;
     n16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output := n16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_705e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_705e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_8d20_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;
     -- t16_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_fc3a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_6a49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_ec73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;

     -- n16_MUX[uxn_opcodes_h_l1127_c7_ec73] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond;
     n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue;
     n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output := n16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_ec73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_ec73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1132_c7_705e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_cond;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output := tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_fc3a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_6a49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;

     -- n16_MUX[uxn_opcodes_h_l1124_c7_6a49] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond;
     n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue;
     n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output := n16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_6a49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1127_c7_ec73] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_cond;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output := tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_705e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_6a49] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_705e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1124_c7_6a49] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_cond;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output := tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_ec73] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output := result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_ec73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_6a49] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output := result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6a49_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_bf3c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1155_l1107_DUPLICATE_b8ea LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1155_l1107_DUPLICATE_b8ea_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_bf3c_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1155_l1107_DUPLICATE_b8ea_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1155_l1107_DUPLICATE_b8ea_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
