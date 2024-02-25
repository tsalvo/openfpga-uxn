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
-- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_7949]
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal t16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal n16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_0c64]
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_0a26]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1038_c7_f67d]
signal t16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1038_c7_f67d]
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1038_c7_f67d]
signal n16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_f67d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_f67d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_f67d]
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_f67d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_f67d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_1f6f]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1041_c7_bc71]
signal t16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1041_c7_bc71]
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1041_c7_bc71]
signal n16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_bc71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_bc71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_bc71]
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_bc71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_bc71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_6994]
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1046_c7_4c46]
signal t16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1046_c7_4c46]
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1046_c7_4c46]
signal n16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_4c46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_4c46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_4c46]
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_4c46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_4c46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1047_c3_8706]
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_c367]
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1050_c7_09a7]
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1050_c7_09a7]
signal n16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_09a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_09a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_09a7]
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_09a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_09a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_6721]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1054_c7_d0e9]
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1054_c7_d0e9]
signal n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_d0e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_d0e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_d0e9]
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_d0e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_d0e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1055_c3_02b3]
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1056_c11_a736]
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1057_c30_9c87]
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_d7cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_7a15]
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_7a15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_7a15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_7a15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1065_c31_f3bd]
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_left,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_right,
BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output);

-- t16_MUX_uxn_opcodes_h_l1025_c2_0c64
t16_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
t16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64
tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- n16_MUX_uxn_opcodes_h_l1025_c2_0c64
n16_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
n16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_cond,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output);

-- t16_MUX_uxn_opcodes_h_l1038_c7_f67d
t16_MUX_uxn_opcodes_h_l1038_c7_f67d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond,
t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue,
t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse,
t16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d
tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond,
tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output);

-- n16_MUX_uxn_opcodes_h_l1038_c7_f67d
n16_MUX_uxn_opcodes_h_l1038_c7_f67d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond,
n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue,
n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse,
n16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output);

-- t16_MUX_uxn_opcodes_h_l1041_c7_bc71
t16_MUX_uxn_opcodes_h_l1041_c7_bc71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond,
t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue,
t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse,
t16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71
tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond,
tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue,
tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse,
tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output);

-- n16_MUX_uxn_opcodes_h_l1041_c7_bc71
n16_MUX_uxn_opcodes_h_l1041_c7_bc71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond,
n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue,
n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse,
n16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_cond,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_left,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_right,
BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output);

-- t16_MUX_uxn_opcodes_h_l1046_c7_4c46
t16_MUX_uxn_opcodes_h_l1046_c7_4c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond,
t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue,
t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse,
t16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46
tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond,
tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue,
tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse,
tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output);

-- n16_MUX_uxn_opcodes_h_l1046_c7_4c46
n16_MUX_uxn_opcodes_h_l1046_c7_4c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond,
n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue,
n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse,
n16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_cond,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706
BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_left,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_right,
BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_left,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_right,
BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7
tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond,
tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output);

-- n16_MUX_uxn_opcodes_h_l1050_c7_09a7
n16_MUX_uxn_opcodes_h_l1050_c7_09a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond,
n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue,
n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse,
n16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9
tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond,
tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output);

-- n16_MUX_uxn_opcodes_h_l1054_c7_d0e9
n16_MUX_uxn_opcodes_h_l1054_c7_d0e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond,
n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue,
n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse,
n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3
BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_left,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_right,
BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736
BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_left,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_right,
BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87
sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_ins,
sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_x,
sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_y,
sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_cond,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd
CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_x,
CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output,
 t16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 n16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output,
 t16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output,
 n16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output,
 t16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output,
 tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output,
 n16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output,
 t16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output,
 tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output,
 n16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output,
 tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output,
 n16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output,
 tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output,
 n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_return_output,
 sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output,
 CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_6a21 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_c0bf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_fbf6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_755f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_dbbd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_312f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_8d07_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_9f43 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_1647 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_2ef3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1025_l1062_l1050_DUPLICATE_e13e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1050_DUPLICATE_9100_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1054_l1050_DUPLICATE_99e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1054_l1050_DUPLICATE_f0d9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_d94b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_ed4f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1069_l1021_DUPLICATE_b92e_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_9f43 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1063_c3_9f43;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_fbf6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_fbf6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_312f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1059_c3_312f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_c0bf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_c0bf;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_dbbd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1048_c3_dbbd;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_1647 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1064_c3_1647;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_755f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1044_c3_755f;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_6a21 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1030_c3_6a21;
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1050_c11_c367] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_left;
     BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output := BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1046_c11_6994] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_left;
     BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output := BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_d94b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_d94b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_0a26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1065_c31_f3bd] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_return_output := CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_1f6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1025_l1062_l1050_DUPLICATE_e13e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1025_l1062_l1050_DUPLICATE_e13e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1025_c6_7949] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_left;
     BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output := BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1050_DUPLICATE_9100 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1050_DUPLICATE_9100_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1062_c11_d7cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1057_c30_9c87] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_ins;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_x;
     sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_return_output := sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1054_l1050_DUPLICATE_99e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1054_l1050_DUPLICATE_99e6_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_ed4f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_ed4f_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1054_l1050_DUPLICATE_f0d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1054_l1050_DUPLICATE_f0d9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_6721] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1025_c6_7949_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_0a26_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_1f6f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1046_c11_6994_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1050_c11_c367_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_6721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1062_c11_d7cd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_d94b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_d94b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1051_l1055_l1042_l1047_DUPLICATE_d94b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1050_DUPLICATE_9100_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1050_DUPLICATE_9100_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1050_DUPLICATE_9100_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1050_DUPLICATE_9100_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1050_DUPLICATE_9100_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1054_l1050_DUPLICATE_f0d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1054_l1050_DUPLICATE_f0d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1054_l1050_DUPLICATE_f0d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1054_l1050_DUPLICATE_f0d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1054_l1050_DUPLICATE_f0d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1062_l1054_l1050_DUPLICATE_f0d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1054_l1050_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1054_l1050_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1054_l1050_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1054_l1050_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1054_l1050_DUPLICATE_99e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_ed4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1062_l1050_DUPLICATE_ed4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1025_l1062_l1050_DUPLICATE_e13e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1025_l1062_l1050_DUPLICATE_e13e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1025_l1062_l1050_DUPLICATE_e13e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1025_l1062_l1050_DUPLICATE_e13e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1025_l1062_l1050_DUPLICATE_e13e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1046_l1041_l1038_l1025_l1062_l1050_DUPLICATE_e13e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1025_c2_0c64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1057_c30_9c87_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1055_c3_02b3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_left;
     BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_return_output := BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_d0e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1062_c7_7a15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1062_c7_7a15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1065_c21_2ef3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_2ef3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1065_c31_f3bd_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1062_c7_7a15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1047_c3_8706] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_left;
     BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_return_output := BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1047_c3_8706_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1055_c3_02b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1065_c21_2ef3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1043_l1052_DUPLICATE_2e8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_d0e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1056_c11_a736] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_left;
     BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_return_output := BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_d0e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1046_c7_4c46] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond;
     t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue;
     t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output := t16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;

     -- n16_MUX[uxn_opcodes_h_l1054_c7_d0e9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond;
     n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue;
     n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output := n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1054_c7_d0e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1062_c7_7a15] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output := result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1050_c7_09a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1062_c7_7a15_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;
     -- n16_MUX[uxn_opcodes_h_l1050_c7_09a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond;
     n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue;
     n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output := n16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1041_c7_bc71] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond;
     t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue;
     t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output := t16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1050_c7_09a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1060_c21_8d07] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_8d07_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c11_a736_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1054_c7_d0e9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output := tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1050_c7_09a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1050_c7_09a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1046_c7_4c46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1060_c21_8d07_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_bc71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;

     -- t16_MUX[uxn_opcodes_h_l1038_c7_f67d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond;
     t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue;
     t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output := t16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1050_c7_09a7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_cond;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output := tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1046_c7_4c46] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond;
     n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue;
     n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output := n16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1054_c7_d0e9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1046_c7_4c46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1046_c7_4c46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1046_c7_4c46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1054_c7_d0e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_bc71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1050_c7_09a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := t16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_f67d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1046_c7_4c46] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_cond;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output := tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_bc71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_bc71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;

     -- n16_MUX[uxn_opcodes_h_l1041_c7_bc71] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond;
     n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue;
     n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output := n16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1050_c7_09a7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_f67d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_f67d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_f67d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1046_c7_4c46] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output := result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1041_c7_bc71] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_cond;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output := tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;

     -- n16_MUX[uxn_opcodes_h_l1038_c7_f67d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond;
     n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue;
     n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output := n16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1046_c7_4c46_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- n16_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := n16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1041_c7_bc71] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output := result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1038_c7_f67d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_cond;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output := tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1041_c7_bc71_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1038_c7_f67d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1038_c7_f67d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1025_c2_0c64] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output := result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1069_l1021_DUPLICATE_b92e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1069_l1021_DUPLICATE_b92e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1025_c2_0c64_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1069_l1021_DUPLICATE_b92e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l1069_l1021_DUPLICATE_b92e_return_output;
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
