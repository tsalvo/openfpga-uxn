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
entity ora2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_50b92fe2;
architecture arch of ora2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_b16a]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal n16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1025_c2_39dd]
signal t16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_728a]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_ef49]
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_ef49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_ef49]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_ef49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_ef49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1038_c7_ef49]
signal n16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1038_c7_ef49]
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1038_c7_ef49]
signal t16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_ba1b]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_d640]
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_d640]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_d640]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_d640]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_d640]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1041_c7_d640]
signal n16_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1041_c7_d640]
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1041_c7_d640]
signal t16_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_9bcd]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_17bc]
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_17bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_17bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_17bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_17bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1046_c7_17bc]
signal n16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1046_c7_17bc]
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1046_c7_17bc]
signal t16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1047_c3_b58a]
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_0146]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_53bf]
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_53bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_53bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_53bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_53bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1050_c7_53bf]
signal n16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1050_c7_53bf]
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_e369]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_bf93]
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_bf93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_bf93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_bf93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_bf93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1054_c7_bf93]
signal n16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1054_c7_bf93]
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1055_c3_23ad]
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1056_c11_ffe0]
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1057_c30_f544]
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_93c3]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_2026]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_2026]
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_2026]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_2026]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1065_c31_4c37]
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- n16_MUX_uxn_opcodes_h_l1025_c2_39dd
n16_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
n16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd
tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- t16_MUX_uxn_opcodes_h_l1025_c2_39dd
t16_MUX_uxn_opcodes_h_l1025_c2_39dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond,
t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue,
t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse,
t16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_cond,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output);

-- n16_MUX_uxn_opcodes_h_l1038_c7_ef49
n16_MUX_uxn_opcodes_h_l1038_c7_ef49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond,
n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue,
n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse,
n16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49
tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond,
tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue,
tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse,
tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output);

-- t16_MUX_uxn_opcodes_h_l1038_c7_ef49
t16_MUX_uxn_opcodes_h_l1038_c7_ef49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond,
t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue,
t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse,
t16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_cond,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_return_output);

-- n16_MUX_uxn_opcodes_h_l1041_c7_d640
n16_MUX_uxn_opcodes_h_l1041_c7_d640 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1041_c7_d640_cond,
n16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue,
n16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse,
n16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1041_c7_d640
tmp16_MUX_uxn_opcodes_h_l1041_c7_d640 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_cond,
tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue,
tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse,
tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output);

-- t16_MUX_uxn_opcodes_h_l1041_c7_d640
t16_MUX_uxn_opcodes_h_l1041_c7_d640 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1041_c7_d640_cond,
t16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue,
t16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse,
t16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output);

-- n16_MUX_uxn_opcodes_h_l1046_c7_17bc
n16_MUX_uxn_opcodes_h_l1046_c7_17bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond,
n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue,
n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse,
n16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc
tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond,
tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output);

-- t16_MUX_uxn_opcodes_h_l1046_c7_17bc
t16_MUX_uxn_opcodes_h_l1046_c7_17bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond,
t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue,
t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse,
t16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a
BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_left,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_right,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output);

-- n16_MUX_uxn_opcodes_h_l1050_c7_53bf
n16_MUX_uxn_opcodes_h_l1050_c7_53bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond,
n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue,
n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse,
n16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf
tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond,
tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_cond,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output);

-- n16_MUX_uxn_opcodes_h_l1054_c7_bf93
n16_MUX_uxn_opcodes_h_l1054_c7_bf93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond,
n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue,
n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse,
n16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93
tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond,
tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue,
tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse,
tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad
BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_left,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_right,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0
BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_left,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_right,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1057_c30_f544
sp_relative_shift_uxn_opcodes_h_l1057_c30_f544 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_ins,
sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_x,
sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_y,
sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_cond,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37
CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_x,
CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 n16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 t16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output,
 n16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output,
 tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output,
 t16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_return_output,
 n16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output,
 tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output,
 t16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output,
 n16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output,
 t16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output,
 n16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output,
 tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output,
 n16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output,
 tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_return_output,
 sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_return_output,
 CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_00ed : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_5f39 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_d87a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_858b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_0849 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_d7d1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_6e1a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_c763 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_1dc4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_1739_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_2d3e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_b023_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_ee7e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_9201_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_e8a2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_e761_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1021_l1069_DUPLICATE_bda7_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_d7d1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_d7d1;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_858b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_858b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_0849 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_0849;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_00ed := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_00ed;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_5f39 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_5f39;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_c763 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_c763;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_d87a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_d87a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_1dc4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_1dc4;
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_right := to_unsigned(6, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_e369] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_ba1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_e8a2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_e8a2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l1057_c30_f544] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_ins;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_x;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_return_output := sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_728a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_b16a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_b023 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_b023_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_0146] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1065_c31_4c37] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_return_output := CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_e761 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_e761_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_ee7e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_ee7e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_93c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_9201 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_9201_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_9bcd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_2d3e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_2d3e_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_b16a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_728a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_ba1b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_9bcd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_0146_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_e369_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_93c3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_e8a2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_e8a2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1047_l1055_l1042_l1051_DUPLICATE_e8a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_b023_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_b023_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_b023_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_b023_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1062_l1050_DUPLICATE_b023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_ee7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_ee7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_ee7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_ee7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_ee7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1062_l1050_DUPLICATE_ee7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_9201_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_9201_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_9201_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_9201_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1038_l1046_l1041_l1054_l1050_DUPLICATE_9201_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_e761_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_e761_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_2d3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_2d3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_2d3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_2d3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_2d3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1038_l1046_l1025_l1041_l1062_l1050_DUPLICATE_2d3e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_39dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_f544_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_2026] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1047_c3_b58a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_left;
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_return_output := BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_bf93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1055_c3_23ad] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_left;
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_return_output := BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1065_c21_1739] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_1739_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_4c37_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_2026] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_2026] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_b58a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_23ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_1739_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1052_l1043_DUPLICATE_d08f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_2026_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_2026_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_2026_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_bf93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1056_c11_ffe0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_left;
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_return_output := BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1046_c7_17bc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond;
     t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue;
     t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output := t16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_53bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;

     -- n16_MUX[uxn_opcodes_h_l1054_c7_bf93] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond;
     n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue;
     n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output := n16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_2026] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_return_output := result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_bf93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_bf93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_2026_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_17bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_53bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;

     -- n16_MUX[uxn_opcodes_h_l1050_c7_53bf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond;
     n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue;
     n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output := n16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_53bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1054_c7_bf93] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_cond;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output := tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1060_c21_6e1a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_6e1a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_ffe0_return_output);

     -- t16_MUX[uxn_opcodes_h_l1041_c7_d640] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1041_c7_d640_cond <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_cond;
     t16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue;
     t16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output := t16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_53bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_6e1a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_17bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_d640] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_17bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_17bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1050_c7_53bf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_cond;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output := tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;

     -- n16_MUX[uxn_opcodes_h_l1046_c7_17bc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond;
     n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue;
     n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output := n16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_bf93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output := result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;

     -- t16_MUX[uxn_opcodes_h_l1038_c7_ef49] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond;
     t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue;
     t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output := t16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_bf93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1046_c7_17bc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_cond;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output := tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_d640] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_d640] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;

     -- t16_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := t16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_53bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_d640] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_ef49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;

     -- n16_MUX[uxn_opcodes_h_l1041_c7_d640] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1041_c7_d640_cond <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_cond;
     n16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue;
     n16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output := n16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_53bf_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_ef49] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_17bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1041_c7_d640] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_cond;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output := tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_ef49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;

     -- n16_MUX[uxn_opcodes_h_l1038_c7_ef49] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond;
     n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue;
     n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output := n16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_ef49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_17bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;
     -- n16_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := n16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1038_c7_ef49] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_cond;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output := tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_d640] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_return_output := result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_d640_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_ef49] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output := result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_ef49_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_39dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1021_l1069_DUPLICATE_bda7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1021_l1069_DUPLICATE_bda7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_39dd_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1021_l1069_DUPLICATE_bda7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1021_l1069_DUPLICATE_bda7_return_output;
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
